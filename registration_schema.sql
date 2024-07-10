USE aldendb;

drop table REGISTRATION;
drop table COLOR;
drop table OWNS;
drop table VEHICLE;
drop table VEHICLE_TYPE;
drop table OWNER;
drop table EMPLOYEE;
drop table REG_ORG;

create table VEHICLE_TYPE
(make /* Make of a vehicle */ varchar(10) not null,
model /* Model of a vehicle */ 
varchar(10) not null,
power /* Motive power (petrol, gas, diesel) */ char(1)
      constraint check_power check (power in ('p','g','d')),
no_pass /* Number of passengers */ integer
      constraint check_pass check (no_pass between 0 and 6),
cap /* Capacity */ float
      constraint check_cap check (cap >= 0),
cc /* Volume of the motor */ integer 
      constraint check_cc check (cc >= 0),
primary key (make,model));

create table OWNER
(dr_lic /* Driver's licence number */ char(8) not null primary key,
IRD /* IRD number of the owner */ char(8),
fname /* Owner's first name */ varchar(15) not null,
init /* Middle initial */ char(1),
lname /* Owner's last name */ varchar(15) not null,
address /* Owner's address */ varchar(30) not null,
bdate /* Owner's birthdate */ date,
sex /* Owner's sex */ char(1),
employer varchar(30),
phone /* Owner's phone number */ varchar(15));

create table EMPLOYEE
(fname /* Employee's first name */ varchar(15) not null,
init /* Employee's middle initial */ char(1),
lname /* Employee's last name */ varchar(15) not null,
IRD /* Employee's IRD number */ varchar(10) not null primary key,
sex /* Employee's sex */ char(1)
       constraint check_sex check (sex in ('f','m','F','M')),
bdate /* Employee's birthdate */ date,
office /* Employee's office */ varchar(5),
reg_org /* The number of the registration office the employee works for */ 
        varchar(10),
sdate /* Starting date in the organization */ date);

create table REG_ORG
(org_number /* The number of the registration organization */ varchar(10) 
            not null primary key,
street /* Street name */ varchar(15) not null,
st_num /* Number in the street */ varchar(6) not null,
city /* City */ varchar(15) not null,
manager /* The manager's IRD number */ varchar(10) references employee);

create table VEHICLE
(plates /* Plate number */ varchar(6) not null primary key,
year /* Year of manufacture */ char(4)
      constraint check_year check (year between '1900' and '2019'),
eng_no /* Engine number */ varchar(9) not null unique,
ch_no /* Chassis number */ varchar(7) not null unique,
type /* Type of the vehicle (taxi, private, truck, ...) */ char(1)
      constraint check_type check (type in ('p','m','t','r','l')),
make /* Make of a vehicle */ varchar(10),
model /* Model of a vehicle */ varchar(10),
foreign key (make,model) references vehicle_type(make,model));

create table OWNS
(plates /* Owner's plates number */ varchar(6) not null references vehicle,
ownerid /* Owner's id number */ char(8) not null references owner,
purchase_date /* The date of purchase */ date,
drr /* The mileage */ char(6),
DateSold /* The date the vehicle was sold */ date default null,
primary key (plates,ownerid));

create table COLOR
(plates /* The plate number */ varchar(6) not null references vehicle,
color /* Color of the vehicle */ varchar(10) not null,
primary key (plates,color));

create table REGISTRATION
(plates /* Plates */ varchar(6) not null references vehicle,
emp /* IRD of the employee who registered the vehicle */ varchar(10) not null references employee,
reg_org /* Organization number */ varchar(10) not null references reg_org,
reg_date /* Registration date */ date not null,
country /* The country */ varchar(10),
drr /* mileage */ char(6),
amount /* the price */ numeric,
primary key (plates,emp,reg_org,reg_date));


#--LAB 3 -- REGISTRATION 
#1. Get full details of all vehicles which were registered during July 2011
SELECT *
FROM vehicle JOIN registration ON registration.plates=vehicle.plates
WHERE reg_date BETWEEN '01-July-2011' AND '31-July-2011';

#2. Get the list of vehicles imported from Japan since 1985 which had been 
#registered less than 3 times in New Zealand, listing their plates, makes and models.
SELECT vehicle.plates, make, model, COUNT(*) AS TOTAL
FROM vehicle, registration R1, registration R2
WHERE R1.country LIKE 'Japan' AND R1.reg_date > '01-jan-1985' AND 
vehicle.plates=R1.plates AND R1.plates=R2.plates
GROUP BY vehicle.plates, make, model
HAVING COUNT(*) < 3;

SELECT vehicle.plates, make, model, COUNT(*) AS TOTAL
FROM vehicle, registration 
WHERE country LIKE 'Japan' AND reg_date > '01-jan-1985' AND 
vehicle.plates=registration.plates
GROUP BY vehicle.plates, make, model
HAVING COUNT(*) < 3;

#3. Find the names of people who own more than one vehicle.
SELECT owner.fname, owner.init, owner.lname, COUNT(*)
FROM owner, owns
WHERE owner.dr_lic=owns.ownerid
GROUP BY owner.fname, owner.lname, owner.init, dr_lic
HAVING COUNT(*) > 1;

SELECT owner.fname, owner.init, owner.lname, COUNT(*)
FROM owner, owns, vehicle
WHERE owner.dr_lic=owns.ownerid and vehicle.plates=owns.plates 
GROUP BY owner.fname, owner.lname, owner.init, dr_lic
HAVING COUNT(*) > 1;

#--LAB 2

SELECT distinct type
FROM vehicle;

SELECT plates, make, model
FROM registration NATURAL JOIN vehicle
WHERE country LIKE 'Japan';

SELECT vehicle.plates, make, model
FROM registration, vehicle
WHERE country LIKE 'Japan' AND registration.plates=vehicle.plates;

SELECT plates, year
FROM vehicle
ORDER BY year;

SELECT fname, lname
FROM owner
ORDER BY lname desc, fname;

SELECT plates, fname, lname, datesold
FROM owner NATURAL JOIN owns
WHERE datesold is NULL;

SELECT plates, fname, lname, datesold
FROM owner JOIN owns ON ownerid=dr_lic
WHERE datesold is NULL;