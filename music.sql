-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL UNIQUE
);

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  artist TEXT[] NOT NULL UNIQUE
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  producer TEXT[] NOT NULL UNIQUE
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist TEXT[] REFERENCES artists(artist),
  album TEXT REFERENCES albums(album) ON DELETE CASCADE,
  producer TEXT[] REFERENCES producers(producer) ON DELETE CASCADE
);
