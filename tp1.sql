CREATE DATABASE ETUDIANTS;

USE ETUDIANTS;

CREATE TABLE ETUDIANT (
Matricule varchar(50) PRIMARY KEY,
Nom varchar(50),
Prenom varchar(50),
DateNaissance date,
Niveau varchar(50)
);

CREATE TABLE COURS (
Code varchar(50) PRIMARY KEY,
NomCours varchar(50),
Enseignant varchar(50)
);

CREATE TABLE EXAMEN (
Matricule varchar(50),
Code varchar(50),
Note Float,
FOREIGN KEY (Matricule) REFERENCES ETUDIANT(Matricule),
FOREIGN KEY (Code) REFERENCES COURS(Code),
CONSTRAINT PK_EXAMEN PRIMARY KEY (Matricule, Code));

INSERT INTO ETUDIANT VALUES 
('e1','NOM1','PRENOM1','1998-12-12','M1'),
('e2','NOM2','PRENOM2','1998-12-12','M2'),
('e3','NOM3','PRENOM3','1998-12-12','M3'),
('e4','NOM4','PRENOM4','1998-12-12','M2'),
('e5','NOM5','PRENOM5','1998-12-12','M2');

INSERT INTO COURS VALUES 
('c1','MAT1','PROF1'),
('c2','MAT2','PROF2'),
('c3','MAT3','PROF3'),
('c4','MAT4','PROF4'),
('c5','MAT5','PROF5');

INSERT INTO EXAMEN VALUES 
('e1','c5',15.8),
('e2','c4',17),
('e3','c3',12),
('e4','c2',8),
('e1','c1',19),
('e5','c3',12),
('e4','c4',8),
('e5','c1',13);