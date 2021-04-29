DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    date_time TIMESTAMP NOT NULL
);

CREATE TABLE diagnosis
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits ON DELETE CASCADE,
    diseases_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

