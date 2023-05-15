/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic ;
\c vet_clinic;
CREATE TABLE animals (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(50) ,
date_of_birth DATE ,
escape_attempts INT,
neutered BOOLEAN ,
weight_kg DECIMAL (7,3)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);
CREATE TABLE owners ( id SERIAL PRIMARY KEY, full_name VARCHAR(255), age INTEGER);
CREATE TABLE species (id SERIAL PRIMARY KEY, name VARCHAR(255));

ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

ALTER TABLE animals ALTER COLUMN id SET DATA TYPE INTEGER;
ALTER TABLE animals ALTER COLUMN id SET NOT NULL;
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1);
ALTER TABLE animals ADD PRIMARY KEY (id);

CREATE TABLE vets (id SERIAL PRIMARY KEY, name VARCHAR(50), age INTEGER, date_of_graduation DATE);

CREATE TABLE specializations (vet_id INTEGER REFERENCES vets(id), species_id INTEGER REFERENCES species(id), PRIMARY KEY (vet_id, species_id));
CREATE TABLE visits (id SERIAL PRIMARY KEY, animal_id INTEGER, vet_id INTEGER, visit_date DATE, FOREIGN KEY (animal_id) REFERENCES animals(id), FOREIGN KEY (vet_id) REFERENCES vets(id));

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
CREATE INDEX visits_animal_desc ON visits(animal_id DESC);
CREATE INDEX owners_email_desc ON owners(email DESC);
CREATE INDEX visits_vet_id ON visits(vet_id DESC);
