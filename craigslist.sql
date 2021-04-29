DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE catagories
(
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT NOT NULL,
    post_location TEXT NOT NULL,
    username_id INTEGER REFERENCES users(id),
    region_id INTEGER REFERENCES regions(id),
    category_id INTEGER REFERENCES catagories(id)
);