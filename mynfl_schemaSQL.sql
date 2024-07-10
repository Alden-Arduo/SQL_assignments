USE aldendb;

DROP TABLE player;
DROP TABLE game;
DROP TABLE team_coach;
DROP TABLE team_stadium;
DROP TABLE team_city;
DROP TABLE player_team;
DROP TABLE stadium;
DROP TABLE city;
DROP TABLE coach;
DROP TABLE team;
DROP TABLE receiver;
DROP TABLE runner;
DROP TABLE quarterback;
DROP TABLE punter;
DROP TABLE kicker;
DROP TABLE defense;
DROP TABLE offensive_line;
#DROP TABLE player CASCADE CONSTRAINTS;


CREATE TABLE player (
     	player_id INT NOT NULL CHECK(player_id > 0),
     	player_surname VARCHAR(20) NOT NULL,
     	player_name VARCHAR(20) NOT NULL,
     	player_dob DATE NOT NULL,
     	university VARCHAR(30) NOT NULL,
     	PRIMARY KEY(player_id) ON DELETE CASCADE
     	);

CREATE TABLE offensive_line (
     	player_id INT NOT NULL CHECK(player_id > 0),
    	position VARCHAR(2) NOT NULL CHECK(position IN ('C', 'LS', 'OG', 'OL', 'OT')),
		pancakes INT NOT NULL CHECK(pancakes >= 0),
     	PRIMARY KEY(player_id),
		FOREIGN KEY(player_id) REFERENCES player(player_id) ON DELETE CASCADE
	);

CREATE TABLE defense (
     	player_id INT NOT NULL CHECK(player_id > 0),
     	position VARCHAR(2) NOT NULL CHECK(position IN ('DB', 'DE', 'DL', 'DT', 'LB')),
     	tackles INT NOT NULL CHECK(tackles >= 0),
		sacks INT NOT NULL,
     	ff INT NOT NULL CHECK(ff >= 0),
     	ints INT NOT NULL CHECK(ints >= 0),
        CHECK(sacks >= 0 AND sacks <= tackles),
     	PRIMARY KEY(player_id),
		FOREIGN KEY(player_id) REFERENCES player(player_id) ON DELETE CASCADE
	);

CREATE TABLE kicker (
		player_id INT NOT NULL CHECK(player_id > 0),
		position VARCHAR(2) NOT NULL CHECK(position IN ('K')),
     	fga INT NOT NULL CHECK(fga >= 0),
		fgm INT NOT NULL CHECK(fgm >=0),
		blocked INT NOT NULL CHECK(blocked >= 0),
		longest INT NOT NULL CHECK(longest BETWEEN 0 AND 117),
        CHECK (fgm <= fga),
        CHECK (blocked <= (fga - fgm)),
     	PRIMARY KEY(player_id),
		FOREIGN KEY(player_id) REFERENCES player(player_id) ON DELETE CASCADE
	);

CREATE TABLE punter (
		player_id INT NOT NULL CHECK(player_id > 0),
		position VARCHAR(2) NOT NULL CHECK(position IN ('P')),
     	punts INT NOT NULL CHECK(punts >= 0),
		net INT NOT NULL CHECK(net >= 0),
		longest INT NOT NULL CHECK(longest BETWEEN 0 AND 100),
     	in20 INT NOT NULL CHECK(in20 >=0),
        CHECK (in20 <= punts),
		PRIMARY KEY(player_id),
		FOREIGN KEY(player_id) REFERENCES player(player_id) ON DELETE CASCADE
	);

CREATE TABLE quarterback (
		player_id INT NOT NULL CHECK(player_id > 0),
		position VARCHAR(2) NOT NULL CHECK(position IN ('QB')),
     	tds INT NOT NULL CHECK(tds >= 0),
		ints INT NOT NULL CHECK(ints >= 0),
		yds INT NOT NULL,
     	att INT NOT NULL CHECK(att >= 0),
     	comp INT NOT NULL CHECK(comp >= 0),
        CHECK (tds <= att),
        CHECK (ints <= att),
        CHECK (comp <= att),
		PRIMARY KEY(player_id),
		FOREIGN KEY(player_id) REFERENCES player(player_id) ON DELETE CASCADE
	);

CREATE TABLE runner (
		player_id INT NOT NULL CHECK(player_id > 0),
		position VARCHAR(2) NOT NULL CHECK(position IN ('RB', 'FB')),
     	carries INT NOT NULL CHECK(carries >= 0),
		fumbles INT NOT NULL CHECK(fumbles >= 0),
		yds INT NOT NULL,
     	tds INT NOT NULL CHECK(tds >= 0),
        CHECK(fumbles <= carries),
        CHECK(tds <= carries),
		PRIMARY KEY(player_id),
		FOREIGN KEY(player_id) REFERENCES player(player_id) ON DELETE CASCADE
	);

CREATE TABLE receiver (
		player_id INT NOT NULL CHECK(player_id > 0),
		position VARCHAR(2) NOT NULL CHECK(position IN ('TE', 'WR')),
     	rec INT NOT NULL CHECK(rec >= 0),
		yds INT NOT NULL,
     	fumbles INT NOT NULL CHECK(fumbles >= 0),
		tds INT NOT NULL CHECK(tds >= 0),
        CHECK (fumbles <= rec),
        CHECK (tds <= rec),
		PRIMARY KEY(player_id),
		FOREIGN KEY(player_id) REFERENCES player(player_id) ON DELETE CASCADE
	);


CREATE TABLE team (
     	team_id VARCHAR(3) NOT NULL,
     	team_name VARCHAR(20) NOT NULL,
     	team_nickname VARCHAR(20) NOT NULL,
		division VARCHAR(10) NOT NULL CHECK(division IN ('North', 'South', 'East', 'West')),
     	conference VARCHAR(10) NOT NULL CHECK(conference IN ('American', 'National', 'Central', '12-great')),
     	wins INT NOT NULL CHECK(wins >= 0),
     	losses INT NOT NULL CHECK(losses >= 0),
     	draws INT NOT NULL CHECK(draws >= 0),
     	founded INT NOT NULL CHECK(founded BETWEEN 1900 AND 2021),
		PRIMARY KEY(team_id)
	);

CREATE TABLE coach (
     	coach_id INT NOT NULL CHECK(coach_id > 0),
		coach_surname VARCHAR(20) NOT NULL,
		coach_name VARCHAR(20) NOT NULL,
    	coaching_position VARCHAR(2) NOT NULL CHECK(coaching_position IN ('HC', 'OC', 'DC', 'SC')),
     	PRIMARY KEY(coach_id)
	);

CREATE TABLE city (
     	city_id INT NOT NULL CHECK(city_id > 0),
     	city_name VARCHAR(20) NOT NULL,
     	city_state VARCHAR(2) NOT NULL,
     	city_weather VARCHAR(20) NOT NULL CHECK(city_weather IN ('Mild', 'Cold', 'Warm')),
     	population NUMERIC NOT NULL CHECK(population BETWEEN 0 AND 999999999),
     	percent_change INT NOT NULL,
		region VARCHAR(30) NOT NULL CHECK(region IN ('Southeast', 'Southwest', 'Mideast', 'Midwest', 'Northeast', 'Northwest', 'Central')),
		annual_income INT NOT NULL,
     	PRIMARY KEY(city_id)
	);

CREATE TABLE stadium (
		stadium_id INT NOT NULL  CHECK(stadium_id > 0),
		stadium_name VARCHAR(30) NOT NULL,
		capacity INT NOT NULL CHECK(capacity > 0),
		turf VARCHAR(15) NOT NULL CHECK(turf IN ('Artificial', 'Natural')),
		current_condition VARCHAR(10) NOT NULL CHECK(current_condition IN ('Excellent', 'Good', 'Fair', 'Poor', 'Bad')),
		opened INT NOT NULL CHECK(opened BETWEEN 1800 AND 2021),
		city_id INT NOT NULL,
		PRIMARY KEY(stadium_id),
		FOREIGN KEY(city_id) REFERENCES city(city_id) ON DELETE CASCADE
	);

CREATE TABLE player_team (
		player_id INT NOT NULL,
		team_id VARCHAR(3) NOT NULL,
		player_number INT NOT NULL CHECK(player_number BETWEEN 1 AND 99),
     	games_played INT NOT NULL CHECK(games_played BETWEEN 0 AND 16),
		games_started INT NOT NULL CHECK(games_started BETWEEN 0 AND 16),
		year_recruited INT NOT NULL CHECK(year_recruited BETWEEN 1900 AND 2021),
		CHECK(games_played >= games_started),
     	PRIMARY KEY(player_id, team_id, year_recruited),
		FOREIGN KEY(player_id) REFERENCES player(player_id) ON DELETE CASCADE,
		FOREIGN KEY(team_id) REFERENCES team(team_id) ON DELETE CASCADE
	);

CREATE TABLE team_city (
		team_id VARCHAR(3) NOT NULL,
		city_id INT NOT NULL,
		fan_support INT NOT NULL CHECK(fan_support BETWEEN -100 AND 100),
     	PRIMARY KEY(team_id),
		FOREIGN KEY(city_id) REFERENCES city(city_id) ON DELETE CASCADE,
		FOREIGN KEY(team_id) REFERENCES team(team_id) ON DELETE CASCADE
	);

CREATE TABLE team_stadium (
		team_id VARCHAR(3) NOT NULL,
		stadium_id INT NOT NULL,
		new_project VARCHAR(30),
		PRIMARY KEY(team_id),
		FOREIGN KEY(stadium_id) REFERENCES stadium(stadium_id) ON DELETE CASCADE,
		FOREIGN KEY(team_id) REFERENCES team(team_id) ON DELETE CASCADE
	);

CREATE TABLE team_coach (
		team_id VARCHAR(3) NOT NULL,
		coach_id INT NOT NULL,
		year_starting INT NOT NULL CHECK(year_starting BETWEEN 1900 AND 2021),
		PRIMARY KEY(coach_id, year_starting),
		FOREIGN KEY(coach_id) REFERENCES coach(coach_id) ON DELETE CASCADE,
		FOREIGN KEY(team_id) REFERENCES team(team_id) ON DELETE CASCADE
	);


CREATE TABLE game (
    game_id integer NOT NULL,
    visitor_team_id VARCHAR(3) NOT NULL,
    local_team_id VARCHAR(3) NOT NULL,
    visitor_score INT NOT NULL CHECK(visitor_score BETWEEN 0 AND 100),
    local_score INT NOT NULL CHECK(local_score BETWEEN 0 AND 100),
    week INT NOT NULL CHECK(week BETWEEN 1 AND 21),
    season integer NOT NULL,
    game_date date NOT NULL,
    game_time VARCHAR(7) NOT NULL,
		PRIMARY KEY(game_id),
		FOREIGN KEY(visitor_team_id) REFERENCES team(team_id) ON DELETE CASCADE,
		FOREIGN KEY(local_team_id) REFERENCES team(team_id) ON DELETE CASCADE
	);

	
	
