USE aldendb;

#LAB PRACTICE TEST QUESTIONS..
#1. Fetch all players that play for 'Washington State' University.
#Expected Columns:
#PLAYER_ID,PLAYER_SURNAME,PLAYER_NAME,PLAYER_DOB,UNIVERSITY
SELECT *
FROM player
WHERE university LIKE 'Washington State';

#3. Fetch the name(s) of the newest coach(es)
#Expected Columns:
#COACH_NAME,COACH_SURNAME
SELECT coach_name, coach_surname
FROM coach NATURAL JOIN team_coach
WHERE year_starting = (SELECT MAX(year_starting) FROM team_coach);

#5. Fetch the names of the players that have changed teams at least once. 
#List the number of teams they have played for. 
#List the player(s) with the most team changes first.
#Expected Columns:
#PLAYER_NAME,PLAYER_SURNAME,NUM_TEAMS
SELECT player_name, player_surname, COUNT(*) as num_teams
FROM player JOIN player_team ON player.player_id=player_team.player_id
GROUP BY player_name, player_surname, player.player_id
HAVING COUNT(*) > 1
ORDER BY num_teams desc;

SELECT player_name, player_surname, COUNT(*) as num_teams
FROM player NATURAL JOIN player_team
GROUP BY player_name, player_surname, player.player_id
HAVING COUNT(*) > 1
ORDER BY num_teams desc;

#7. Generate a list stadiums where at least one game has been played. 
#For each stadium find the largest score differential between visiting 
#and local teams for in that stadium.
#Expected Columns:
#STADIUM_NAME,DELTA
SELECT stadium_name, MAX(ABS(visitor_score-local_score)) AS delta
FROM stadium, team_stadium, game
WHERE stadium.stadium_id=team_stadium.stadium_id 
AND team_stadium.team_id=game.local_team_id
GROUP BY stadium_name, stadium.stadium_id
HAVING COUNT(*) > 1;

#9. Find the average score of visiting and local teams for 
#games played on 'Natural' turf. Round both averages to two decimal places.
#Expected Columns:
#VISITOR,LOCAL
SELECT TRUNC(AVG(visitor_score),2) AS visitor, TRUNC(AVG(local_score),2) AS local
FROM game, team_stadium, stadium
WHERE game.local_team_id=team_stadium.team_id 
AND stadium.stadium_id=team_stadium.stadium_id
AND turf LIKE 'Natural'; 

#11. How many cities are not associated with a team?
#Expected Columns:
#NO_TEAM_COUNT
SELECT COUNT(*) as no_team_count
FROM city
WHERE city_id NOT IN (SELECT city_id FROM city NATURAL JOIN team_city); 

#13. Get a list of cites that have multiple teams. 
#Present the list in alphabetical order.
#Expected Columns:
#CITY_NAME
SELECT city_name
FROM city NATURAL JOIN team_city
GROUP BY city_name, city_id
HAVING COUNT(*) > 1
ORDER BY city_name;

#15. List coaches (if any) of teams with same number of wins as losses. 
#Do not include any teams that are yet to play a game.
#Expected Columns:
#COACH_NAME,COACH_SURNAME
SELECT coach_name, coach_surname
FROM coach, team_coach, team, game
WHERE coach.coach_id=team_coach.coach_id 
AND team_coach.team_id=team.team_id
AND game.local_team_id=team.team_id AND
wins = losses AND game_date < (SELECT MAX(game_date) FROM game)
GROUP BY coach_name, coach_surname, coach.coach_id;

SELECT coach_name, coach_surname
FROM coach, team_coach, team
WHERE coach.coach_id=team_coach.coach_id 
AND team_coach.team_id=team.team_id
AND wins = losses AND wins != 0;

SELECT coach_name, coach_surname
FROM coach NATURAL JOIN team_coach NATURAL JOIN team
WHERE year_starting < (SELECT MAX(year_starting)
                        FROM team_coach) 
AND wins = losses;

#17. Find the offensive line player with highest PANCAKES for that 
#DIVISION and CONFERENCE, order the player names from most to least pancakes.
#Expected Columns:
#PLAYER_NAME,PLAYER_SURNAME
SELECT player_name, player_surname
FROM offensive_line NATURAL JOIN player NATURAL JOIN player_team NATURAL JOIN team t
WHERE pancakes = (SELECT MAX(pancakes)
                  FROM offensive_line NATURAL JOIN player_team NATURAL JOIN team
                  WHERE t.division=division AND t.conference=conference)
ORDER BY pancakes DESC;

SELECT player_name, player_surname
FROM offensive_line NATURAL JOIN player NATURAL JOIN player_team NATURAL JOIN team t
WHERE pancakes = (SELECT MIN(pancakes)
                  FROM offensive_line NATURAL JOIN player_team NATURAL JOIN team
                  WHERE t.division=division AND t.conference=conference)
ORDER BY pancakes DESC;


