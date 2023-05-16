CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    FOREIGN KEY patient_id INT REFERENCES patients(id),
    status VARCHAR(80)
);

CREATE INDEX idx_medical_histories_patient_id ON medical_histories (patient_id);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL(10,2) NOT NULL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    FOREIGN KEY medical_history_id INT REFERENCES medical_histories(id)
);

CREATE INDEX idx_invoices_medical_history_id ON invoices (medical_history_id);

CREATE TABLE treatments (
    id INT PRIMARY KEY REFERENCES medical_histories(id),
    type VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2),
    FOREIGN KEY invoice_id INT REFERENCES invoices(id),
    FOREIGN KEY treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX idx_invoice_items_invoice_id ON invoice_items (invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items (treatment_id);

CREATE TABLE invoice_treatments (
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY (invoice_id, treatment_id)
);
