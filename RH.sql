CREATE TABLE Classification (
    id_classification SERIAL PRIMARY KEY,        
    nom VARCHAR(100) NOT NULL,   
    niveau INT NOT NULL,            
    salaire_min DECIMAL(10, 2) NOT NULL,     
    salaire_max DECIMAL(10, 2) NOT NULL    
);

INSERT INTO Classification (nom, niveau, salaire_min, salaire_max)
VALUES
('Ouvrier', 1, 1500.00, 2000.00),              
('Technicien', 2, 2000.00, 3000.00),          
('Agent de Maîtrise', 3, 2500.00, 3500.00),    
('Cadre', 4, 3500.00, 5000.00),              
('Cadre Supérieur', 5, 5000.00, 7000.00),    
('Hors-Cadre', 6, 7000.00, 12000.00);         


CREATE TABLE positions (    --  Categorie Personnel
    id_position SERIAL PRIMARY KEY,                   
    nom VARCHAR(100) NOT NULL,                
    id_classification INT REFERENCES Classification(id_classification)
);

INSERT INTO positions (nom, id_classification)
VALUES
('Ouvrier de production', 1),                        
('Technicien de maintenance', 2),                
('Chef d équipe', 3),                                
('Développeur informatique', 2),                    
('Responsable marketing', 4),                       
('Directeur commercial', 5),          
('Directeur général', 6);     

CREATE TABLE employees (
    id_personnel SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_of_birth DATE,
    date_embauche DATE,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    address TEXT,
    id_departement INT REFERENCES departments(id_departement),
    id_position INT REFERENCES positions(id_position),
    status VARCHAR(50), 
    termination_date DATE,  
    id_contrat INT REFERENCES contrat(id_contrat)
);

CREATE TABLE deductions (
    deduction_id SERIAL PRIMARY KEY,
    payroll_id INT REFERENCES payrolls(payroll_id),
    deduction_type VARCHAR(100), -- ex. "Sécurité Sociale", "Retraite", etc.
    deduction_amount DECIMAL(10, 2) -- Montant de la déduction
);

CREATE TABLE conventions_collectives (
    convention_id SERIAL PRIMARY KEY,
    id_classification INT REFERENCES classification(id_classification),
    collective_name VARCHAR(100), -- ex. "Convention nationale des cadres", etc.
    salary_increase_percentage DECIMAL(5, 2) -- Augmentation salariale prévue pour la catégorie
);

CREATE TABLE primes (
    id_prime SERIAL PRIMARY KEY,
    designation VARCHAR(255) NOT NULL,
    'description' VARCHAR(255),
);