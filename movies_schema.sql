USE aldendb;

CREATE TABLE DIRECTOR
(DNUMBER /* Unique number */ INTEGER NOT NULL,
LNAME /* Last name */ VARCHAR(16) NOT NULL,
FNAME /* First name */ VARCHAR(15),
BORN /* Year of birth */ INTEGER 
                constraint dir_born check (BORN between 1880 and 1990),
DIED /* Year of death */ INTEGER constraint dir_died check (DIED>1930),
constraint corr_years check (born <= died),
PRIMARY KEY(DNUMBER));

CREATE TABLE MOVIE
(MNUMBER /* Unique number for a movie */ INTEGER NOT NULL PRIMARY KEY,
TITLE /* Title */ VARCHAR(50) not null,
TYPE /* Type of the movie */ VARCHAR(15) NOT NULL,
AANOM /* Number of nominations for Academy Awards */ INTEGER,
AAWON /* Number of AA won */ INTEGER,
YEAR /* Year when the movie was made */ INTEGER,
CRITICS /* Critics' rating */ VARCHAR(2),
DIRECTOR /* Director's number */ INTEGER REFERENCES DIRECTOR);

CREATE TABLE STAR
(SNUMBER /* Unique number */ INTEGER NOT NULL,
LNAME /* Last name */ VARCHAR(15) NOT NULL,
FNAME /* First name */ VARCHAR(15),
BORN /* Year of birth */ INTEGER 
                constraint check_born check (BORN between 1880 and 2000),
DIED /* Year of death */ INTEGER constraint check_died check (DIED>1930),
CITY /* City of birth */ VARCHAR(15),
constraint corr_syears check (born <= died),
PRIMARY KEY (SNUMBER));

CREATE TABLE CUSTOMER
(LNAME /* Last name */ VARCHAR(15) NOT NULL,
FNAME /* First name */ VARCHAR(15) NOT NULL,
CNUMBER /* Unique number */ INTEGER NOT NULL,
ADDRESS /* Customer's address */ VARCHAR(40),
RENTALS /* The number of DVDs rented */ INTEGER check (rentals>=0),
BONUS /* 1/10 of RENTALS */ INTEGER,
JDATE /* Date of joining the club */ DATE,
PRIMARY KEY (CNUMBER));

CREATE TABLE DVD
(CODE /* Unique number */ INTEGER NOT NULL,
MOVIE /* Movie number */ INTEGER NOT NULL,
PDATE /* Purchase date */ DATE,
TIMES /* Times rented */ INTEGER default 0,
CUSTOMER /* Number of the customer renting the DVD */ INTEGER,
HIREDATE /* Date of hire */ DATE,
PRIMARY KEY (CODE),
FOREIGN KEY (CUSTOMER) REFERENCES CUSTOMER(CNUMBER),
FOREIGN KEY (MOVIE) REFERENCES MOVIE(MNUMBER),
CONSTRAINT CHECK_TIMES CHECK (TIMES >= 0));

CREATE TABLE STARS
(MOVIE /* Movie number */ INTEGER NOT NULL REFERENCES MOVIE(MNUMBER),
STAR /* Star number */ INTEGER NOT NULL REFERENCES STAR(SNUMBER),
ROLE /* Name of the role */ VARCHAR(20) NOT NULL,
PRIMARY KEY (MOVIE,STAR,ROLE));


#--LAB 3 -- MOVIES
#1. Find names of stars who acted in movies directed by Sofia Coppola.
SELECT distinct star.fname, star.lname
FROM star, stars, movie, director
WHERE director.fname LIKE 'Sofia' AND director.lname LIKE 'Coppola' AND 
movie.mnumber=stars.movie AND star.snumber=stars.star AND 
director.dnumber=movie.director;

#2.Find names of stars who acted in at least two movies directed by Sofia Coppola
SELECT star.fname, star.lname, COUNT(*)
FROM star, director, movie, stars
WHERE director.fname LIKE 'Sofia' AND director.lname LIKE 'Coppola' AND 
movie.mnumber=stars.movie AND star.snumber=stars.star AND 
director.dnumber=movie.director
GROUP BY star.fname, star.lname, star.snumber
HAVING COUNT(*) >= 2;

#3. Show types of movies for which there are more than 5 movies in the database. 
#Order the results by decreasing number of movies
SELECT type, COUNT(*) as TOTAL
FROM movie
GROUP BY movie.type
HAVING COUNT(*) > 5
ORDER BY TOTAL desc;

#4.Find the names of all directors who directed at least as many movies as the director
#number 15. 
SELECT fname, lname
FROM director JOIN movie ON movie.director=director.dnumber
GROUP BY director, director.fname, director.lname
HAVING COUNT(*) >= (SELECT COUNT(*) FROM movie WHERE director LIKE 15);

#5. Find the director who has directed most dramas.
SELECT fname,lname
FROM director JOIN movie ON movie.director=director.dnumber
GROUP BY director, director.fname, director.lname
HAVING COUNT(*) >= ALL (SELECT COUNT(*) 
                        FROM movie 
                        WHERE type LIKE 'DRAMA'
                        GROUP BY director);


#--LAB 2
SELECT distinct type 
FROM movie;

SELECT *
FROM star
WHERE snumber LIKE 4;

SELECT lname, fname, born, city
FROM star
WHERE snumber LIKE 50;

SELECT lname, fname
FROM star
WHERE born >= 1950;

SELECT mnumber, title
FROM movie
WHERE year BETWEEN 1965 AND 1975;

SELECT mnumber, title
FROM movie
WHERE type LIKE 'fantasy' OR type LIKE 'romance';

SELECT fname, lname, born, city
FROM star
WHERE born LIKE '192_' AND died IS NULL;

SELECT distinct star
FROM stars
WHERE movie BETWEEN 85 AND 91;

SELECT fname, lname, died-born
FROM director
WHERE died is NOT NULL;

SELECT sum(aawon)
FROM movie
WHERE type LIKE 'comedy';

SELECT title, fname, lname
FROM movie, director
WHERE movie.director=director.dnumber;

SELECT fname, lname
FROM stars, star, movie
WHERE role LIKE 'Vronsky' AND title LIKE 'Anna Karenina' AND stars.star=star.snumber 
AND stars.movie=movie.mnumber;
