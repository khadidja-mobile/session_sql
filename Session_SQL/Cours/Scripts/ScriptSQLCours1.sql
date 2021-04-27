-- Script SQL

-- Langage de définition de données

-- Creation d'un base de données
DROP DATABASE IF EXISTS formation_db;
CREATE DATABASE IF NOT EXISTS formation_db; 

-- Utilisation d'une bd
USE formation_db;

-- Création de la table person, avec la declaration de la colonne id en tant que cle primaire
-- Une clé primaire est identifie un ensemble de colonnes

DROP TABLE IF EXISTS person;

CREATE TABLE person(
	id int PRIMARY KEY,
    nom varchar(45),
    prenom varchar(45),
    salaire int,
	ville varchar(45)
);

-- ou 

CREATE TABLE person(
	id int,
    nom varchar(45),
    prenom varchar(45),
	salaire int,
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

-- Langage de Manipulation de données

-- Inserer une valeur pour chaque colonne
INSERT INTO person VALUES
(1, 'Durand', 'Philippe', 2000, 'Marseille'),
(2, 'Leberre', 'Bernard', 1500, 'Paris'),
(3, 'Benammar', 'Pierre', 1800, 'Lyon'),
(4, 'Hadad', 'Karim', 1500, 'Paris');

INSERT INTO person SET id=5, nom='Cooper', prenom='David', salaire=3000, ville='Marseille';

-- Inserer une valeur pour chaque colonne
INSERT INTO person(id, nom, prenom) VALUES (6, 'Benatia', 'Sonia');

INSERT INTO car VALUES
(100,'Renault','Clio',2008,1),
(200,'Peugeot','206',2017,2),
(300,'Citroen','AX',1999,3),
(400,'Fiat','Panda',1994,4),
(500,'BMW','Z3',2000,3);

-- Supprime des tuples respectant une ou plusieurs conditions
DELETE FROM person
WHERE salaire > 2000 AND ville = 'Marseille';

-- Supprime tous les tuples de la table mais pas la structure
-- DELETE FROM person;

-- Modifie des tuples respectant une ou plusieurs conditions
UPDATE person
SET salaire = 1600, ville = 'Toulouse'
WHERE id = 6;

-- Modifie tous les tuples
UPDATE person
SET ville = 'Marseille';

-- Langage d'interrogation de données

-- Une requète SQL de lecture est composée d'au moins deux clauses :

-- SELECT : selectionner les colonnes
-- FROM : cibler la table concerné

-- WHERE : Déclarer une condition
-- ....

-- Selectionne toutes les données de la table person
SELECT * FROM person;

-- Selectionne les colonnes nom et prenom de la table person
SELECT nom, prenom
FROM person;

-- Selection la colonne ville de la table person
SELECT ville
FROM person;

-- Supprime les doublons
SELECT distinct(ville)
FROM person;


-- Compte le nombre de ville dans la table person
-- La fonction d'aggrégation COUNT() permet de compter la nombre 
-- d'enregistrements, ici le nombre de villes distinctes dans la table person
SELECT COUNT(distinct(ville)) AS nombre_ville
FROM person;

-- Selectionne les deux premières personnes
SELECT *
FROM person
LIMIT 2;

-- Selectionne les deux personnes suivantes
SELECT *
FROM person
LIMIT 2, 2;

-- Selectionne toutes les personnes dont la ville est Marseille
SELECT * 
FROM person
WHERE ville = 'Marseille';

-- Opérateurs logiques :
-- AND
-- OR
-- !

-- Ecrire une requete SQL qui permet de selectionner les personnes qui
-- habitent Marseille ou Lyon.

SELECT * FROM person
WHERE ville = 'Lyon' OR ville = 'Marseille';

-- Ecrire une requete SQL qui permet de selectionner les personnes dont
-- le salaire est compris entre 2000 et 3000.

SELECT * FROM person
WHERE salaire >= 2000 AND salaire <= 3000;

SELECT *
FROM personne
WHERE salaire BETWEEN 2000 AND 3000;

-- Ecrire une requete SQL qui permet de selectionner les personnes qui
-- habitent Marseille et dont le salaire est soit inferieur ou egal a 2000 soit
-- superieur ou egal a 2500.

SELECT * FROM person
WHERE (salaire <= 2000 OR salaire >= 2500) AND ville ='Marseille';

-- Selectionne les personnes dont le nom de la ville contient le caractère a
SELECT *
FROM person
WHERE ville like '%a%';

-- Selectionne les personnes dont le nom de la ville commence par le caractère p
SELECT *
FROM person
WHERE ville like 'p%';

-- Selectionne les personnes dont le nom de la ville finit par le caractère s
SELECT *
FROM person
WHERE ville like '%s';

-- Selectionne les personnes dont le cinquieme caractère est un d
SELECT *
FROM person
WHERE nom like '____d%';

-- Selectionne les voitures dont l'id du propriétaire est non-null
-- cad, toutes les voitures qui ont un proprietaire
SELECT * 
FROM car 
WHERE id_person IS NOT NULL;

-- Utiliser la fonction IFNULL() por remplacer les valeurs nulles par une autre valeur
SELECT marque, IFNULL(id_person, 'pas de propriétaire') AS proprietaire
FROM car;


-- Ordonne le resultat selon le numero du proprietaire
-- ORDER BY : ASC par defaut, sinon declarer DESC pour un ordre décroissant
SELECT * 
FROM car 
WHERE id_person IS NOT NULL
ORDER BY id_person DESC;

-- Compte le nombre de vehicule pour chaque personne
-- Il faut les regrouper avec GROUP BY, ici selon la colonne id_person
SELECT id_person, COUNT(*) AS nombre_vehicule
FROM car
WHERE id_person IS NOT NULL
GROUP BY id_person;

-- Fonctions d'aggregation

-- COUNT()
-- MAX()
-- MIN()
-- SUM() 
-- AVG() : moyenne

-- Ecrire une requete SQL qui permet de compter la somme des salaires
-- regroupe par ville

SELECT ville, SUM(salaire) AS montant_total
FROM person
GROUP BY ville;
