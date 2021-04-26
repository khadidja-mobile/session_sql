-- Script SQL

-- Langage de définition de données

-- Creation d'un base de données
CREATE DATABASE formation_db;

-- Utilisation d'une bd
USE formation_db;

-- Création de la table person, avec la declaration de la colonne id en tant que cle primaire
-- Une clé primaire est identifie un ensemble de colonnes

CREATE TABLE person(
	id int PRIMARY KEY,
    nom varchar(45),
    prenom varchar(45),
	ville varchar(45)
);

-- ou 

CREATE TABLE person(
	id int,
    nom varchar(45),
    prenom varchar(45),
	ville varchar(45),
    PRIMARY KEY(id)
);

CREATE TABLE car(
	immatriculation int PRIMARY KEY AUTO_INCREMENT,
    marque varchar(45),
    modele varchar(45),
	annee int, 
    id_person int,
    FOREIGN KEY (id_person) REFERENCES person(id)
);

-- Nommer la contrainte cle primaire
CREATE TABLE employe(
	cin char(6),
    prenom char(20),
    nom char(20),
    CONSTRAINT pk_employe PRIMARY KEY (prenom, nom)
);

-- AUTO_INCREMENT, par defaut, il commence de 1.
CREATE TABLE etudiant(
	id int PRIMARY KEY AUTO_INCREMENT,
    age int,
    CHECK (age < 150)
);

-- On peut toujours changer sa valeur initiale : AUTO INCREMENT = 100
ALTER TABLE etudiant AUTO_INCREMENT = 100;

-- Pour rendre une colonne auto-increment apr`es cr´eation de la table
ALTER TABLE etudiant
MODIFY COLUMN id int AUTO_INCREMENT;

-- Supprimer une cle primaire
ALTER TABLE employe
DROP PRIMARY KEY;

-- Declarer une cle primaire pour une table deja existante
ALTER TABLE employe
ADD CONSTRAINT pk_employe PRIMARY KEY (cin);

-- Consulter la liste des tables d’une base de donnees
SHOW TABLES;

SHOW COLUMNS FROM person;

-- Ajoute une colonne à la table etudiant
ALTER TABLE etudiant
ADD nom varchar(20);

-- Ajoute une colonne à la table etudiant à une position donnée
ALTER TABLE etudiant
ADD prenom varchar(20)
AFTER id;

-- Ajoute une colonne à la table etudiant
ALTER TABLE etudiant
ADD codePostale varchar(20);

-- Supprime une colonne de la table etudiant
ALTER TABLE etudiant
DROP age;

-- Modifie le nom de la colonne, ici codePostale en codePostal dans table etudiant
-- Possible de renommer la colonne
ALTER TABLE etudiant
CHANGE codePostale codePostal int;

-- Modifie le type de la colonne, ici int en varchar(45) dans table etudiant
-- Impossible de renommer la colonne
ALTER TABLE etudiant
MODIFY codePostal varchar(45) NOT NULL UNIQUE;

-- Pour supprimer une table
DROP TABLE etudiant;

-- Pour supprimer toutes les donnees d’une table sans supprimer la table
TRUNCATE TABLE etudiant;
