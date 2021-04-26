-- Script SQL

-- Langage de définition de données

-- Creation d'un db de données
-- DROP DATABASE IF EXISTS formation_db;
CREATE DATABASE formation_db;

-- Utilisation d'une bd

-- DROP TABLE IF EXISTS person;
USE formation_db;

-- Création de la table person, avec la declaration de la colonne id en tant que cle primaire
-- Une clé primaire est identitifie un ensemble de colonnes
CREATE TABLE person(
	id int,
    nom varchar(45),
    prenom varchar(45),
    ville varchar(45),
    PRIMARY KEY(id)
);

-- AUTO_INCREMENT, par défaut, il commence par 1
CREATE TABLE etudiant(
	id int PRIMARY KEY AUTO_INCREMENT,
    age int,
    CHECK(age < 150)
);
-- On peut toujours changer la valeur initiale : AUTO INCREMENT = 100
ALTER TABLE etudiant AUTO_INCREMENT = 100;

ALTER TABLE etudiant
MODIFY COLUMN id int AUTO_INCREMENT;

CREATE TABLE employe(
	cin char(6),
	prenom char(20),
	nom char(20),
	CONSTRAINT pk_employe PRIMARY KEY (prenom, nom)
);
-- Supprimer une clé primaire
ALTER TABLE employe
DROP PRIMARY KEY;

-- Déclarer une clé primaire pour une table déja exisitante
ALTER TABLE employe
ADD CONSTRAINT pk_employe PRIMARY KEY (cin);

-- Consulter la liste des tables d'une base de données
SHOW TABLES;
SHOW COLUMNS FROM person;

-- Ajouter une colonne
ALTER TABLE etudiant
ADD nom varchar(20)
AFTER id;

-- Supprimer une colonne de la table etudiant
ALTER TABLE etudiant
DROP age;

-- Ajouter une colonne
ALTER TABLE etudiant
ADD codePostale varchar(20);

-- Renommer la colonne
ALTER TABLE etudiant
CHANGE codePostale codePostal int;

-- changer le type
ALTER TABLE etudiant
MODIFY codePostal varchar(45) NOT NULL UNIQUE; -- une seule fois dans la table

-- Supprimer une table
DROP TABLE etudiant;

-- Supprimer les données sans supprimer la table
TRUNCATE TABLE etudiant;

CREATE TABLE car(
	immatriculation int PRIMARY KEY AUTO_INCREMENT,
    marque varchar(45),
	modele varchar(45),
	annee int,
    id_person int,
    FOREIGN KEY (id_person) REFERENCES person(id)
);

-- workbench shell ou MySQL Shell >> \sql >> \connect root@127.0.0.1:3306 >> root >> Y >> SHOW DATABASES;

-- Ajouter une colonne
ALTER TABLE person
ADD salaire int
AFTER prenom;

-- Insérer pour chaque colomne
INSERT INTO person VALUES
(1, 'Durand', 'Philippe', 2000, 'Marseille'),
(2, 'Leberre', 'Bernard', 1500, 'Paris'),
(3, 'Benamer', 'Pierre', 1800, 'Lyon'),
(4, 'Hadad', 'Karim', 1500, 'Paris');

INSERT INTO person SET id=5, nom='Cooper', prenom='David', salaire=3000, ville='Marseille';

-- Inserer valeur à chaque colomne
INSERT INTO person(id, nom, prenom) VALUES (6, 'Benatia', 'Sonia');

-- Supprimer des tuples respectant une ou plusieurs conditions
DELETE FROM person
WHERE salaire > 2000 AND ville ='Marseille';

-- Supprime tous les tuples de la table mais pas la strucure 
DELETE FROM person;

-- Modifie tous les tuples respectant une ou pluseiurs conditions
UPDATE person
SET salaire = 1600, ville = 'Toulouse'
WHERE id = 6;

INSERT INTO car VALUES
(100,'Renault','clio',2001,1),
(200,'Peugeot','307',2004,2),
(300,'Fiat','Punto',2002,3),
(400,'Golf','Polo',2010,4),
(500,'Lamborghini','aventadors',2021,6);


