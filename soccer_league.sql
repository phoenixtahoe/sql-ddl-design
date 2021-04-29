DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    team_city TEXT NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    current_team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    referee_name TEXT NOT NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_season TEXT NOT NULL,
    end_season TEXT NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams(id),
    away_team_id INTEGER REFERENCES teams(id),
    match_date TEXT NOT NULL,
    referee_id INTEGER REFERENCES referees(id),
    season_id INTEGER REFERENCES seasons(id),
    match_location TEXT NOT NULL
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(id),
    match_id INTEGER REFERENCES matches(id),
    result TEXT NOT NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(id),
    match_id INTEGER REFERENCES matches(id)
);