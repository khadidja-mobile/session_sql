CREATE DATABASE notes_tp;

USE notes_tp;

CREATE TABLE etudiant(
  matricule INT PRIMARY KEY,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  date_naissance date,
  niveau VARCHAR(50)
);

CREATE TABLE cours(
  code INT PRIMARY KEY,
  nom_cours VARCHAR(50), 
  enseignant VARCHAR(50)
);

CREATE TABLE examen(
  matricule INT,
  code INT,
  note FLOAT, 
  FOREIGN KEY (matricule) REFERENCES etudiant(matricule),
  FOREIGN KEY (code) REFERENCES cours(code),
  CONSTRAINT pd_examen PRIMARY KEY(matricule,code)
);