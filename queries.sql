/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'yes' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * from animals;
UPDATE animals SET species = 'pokemon' WHERE species IS NULL or species = '';
SELECT * from animals;
COMMIT;
BEGIN;
DELETE FROM animals;
SELECT * from animals;
ROLLBACK;
SELECT * from animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * from animals ;
SAVEPOINT MYTRANSACTION;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO MYTRANSACTION;
SELECT * from animals ;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * from animals ;
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals where escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) AS avg_escape_attempts FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01'AND '2000-12-31' GROUP BY species;
