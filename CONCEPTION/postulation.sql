CREATE TABLE Utilisateur(
   id_utilisateur SERIAL,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   date_naissance DATE,
   adresse VARCHAR(50)  NOT NULL,
   mail VARCHAR(50) ,
   etat_civil VARCHAR(50)  NOT NULL,
   photo VARCHAR(50)  NOT NULL,
   point DOUBLE PRECISION NOT NULL,
   latitude NUMERIC(15,2)  ,
   longitude NUMERIC(15,2)  ,
   motdepasse VARCHAR(50)  NOT NULL,
   description TEXT,
   salaire_recherche NUMERIC(15,2)  ,
   PRIMARY KEY(id_utilisateur),
   UNIQUE(mail)
);

CREATE TABLE Secteur(
   id_secteur VARCHAR(50) ,
   secteur VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_secteur)
);

CREATE TABLE Diplome(
   id_diplome VARCHAR(50) ,
   diplome VARCHAR(50)  NOT NULL,
   niveau INTEGER NOT NULL,
   PRIMARY KEY(id_diplome)
);

CREATE TABLE Entreprise(
   id_entreprise SERIAL,
   entreprise VARCHAR(50)  NOT NULL,
   point BIGINT,
   type VARCHAR(50) ,
   date_creation DATE NOT NULL,
   adresse VARCHAR(50) ,
   site_web VARCHAR(50) ,
   mail VARCHAR(50) ,
   latitude NUMERIC(15,2)  ,
   longitude NUMERIC(15,2)  ,
   image VARCHAR(50) ,
   PRIMARY KEY(id_entreprise),
   UNIQUE(mail)
);

CREATE TABLE poste(
   id_poste SERIAL,
   description VARCHAR(50) ,
   date_insertion DATE NOT NULL,
   salaire NUMERIC(15,2)   NOT NULL,
   titre VARCHAR(50)  NOT NULL,
   annee_experience INTEGER,
   annee_formation INTEGER,
   age_min INTEGER,
   age_max VARCHAR(50) ,
   image VARCHAR(50) ,
   cout INTEGER NOT NULL,
   disponibilite BOOLEAN NOT NULL,
   id_utilisateur INTEGER NOT NULL,
   id_entreprise INTEGER NOT NULL,
   PRIMARY KEY(id_poste),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
   FOREIGN KEY(id_entreprise) REFERENCES Entreprise(id_entreprise)
);

CREATE TABLE competence(
   id_competence SERIAL,
   competence VARCHAR(50)  NOT NULL,
   description TEXT,
   PRIMARY KEY(id_competence)
);

CREATE TABLE experience(
   id_experience SERIAL,
   date_debut DATE NOT NULL,
   date_fin DATE,
   description TEXT NOT NULL,
   id_secteur INTEGER NOT NULL,
   id_utilisateur INTEGER NOT NULL,
   PRIMARY KEY(id_experience),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE formation(
   id_formation SERIAL,
   date_debut DATE NOT NULL,
   description TEXT NOT NULL,
   id_diplome INTEGER NOT NULL,
   date_fin DATE,
   id_utilisateur INTEGER NOT NULL,
   PRIMARY KEY(id_formation),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);
