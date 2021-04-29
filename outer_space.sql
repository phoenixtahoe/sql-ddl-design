DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY, 
  is_orbited TEXT NOT NULL UNIQUE
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL UNIQUE
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits TEXT REFERENCES orbits_around(is_orbited),
  galaxy TEXT REFERENCES galaxies(galaxy),
  moons TEXT[]
);

INSERT INTO orbits_around(is_orbited)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxies
  (galaxy)
VALUES 
  ('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');