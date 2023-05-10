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
