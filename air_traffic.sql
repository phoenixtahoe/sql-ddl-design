-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  country_id INT REFERENCES countries,
  name TEXT NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airlines,
  from_city_id INT REFERENCES cities,
  to_city_id INT REFERENCES cities
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  passenger_name TEXT NOT NULL,
  flight_id INT REFERENCES flights,
  seat_number VARCHAR(4)
);