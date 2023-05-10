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

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name AS animal_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
ORDER BY owners.full_name;

SELECT species.name, COUNT(animals.id) AS animal_count
FROM animals
INNER JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name 
FROM animals
INNER JOIN species ON animals.species_id = species.id
INNER JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name
FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT owners.full_name, COUNT(*) as num_animals_owned
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY num_animals_owned DESC
LIMIT 1;
