CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    FOREIGN KEY patient_id INT REFERENCES patients(id),
    status VARCHAR(80),
);