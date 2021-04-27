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

-- Une requête d'interrogation de données

-- SELECT : selectionner les colonnes
-- FROM : cibler la table
-- Where : Déclarer une condition
-- ...alter
-- Selectionner tous 
SELECT * from car;
SELECT nom, prenom FROM person;
SELECT ville FROM person;

-- Supprime les doublons
SELECT distinct(ville) FROM person;
SELECT distinct ville FROM person;
-- regroupper par ville 
SELECT ville FROM person GROUP BY ville;

-- Selectionner les deux premieres suivantes
SELECT *
FROM person
LIMIT 2;

SELECT *
FROM person
LIMIT 2, 2;

-- Compte le nombre de ville dans la table person
-- la fonction d'agrégation COUNT () permet de compter le nombre
-- d'enregistrement, ici le nombdre de ville distinctes dans la table person

SELECT COUNT(distinct(ville)) AS nombre_ville FROM person;

-- Ecrire requete SQL qui permet de selectionner les personnes qui habitent Marseille et Lyon
SELECT nom, prenom, ville FROM person WHERE ville = 'Marseille' OR ville ='Lyon';
-- Ecrire requete qui permet de selectionner les peronnes dont le salaire est compris entre 2000 et 3000
SELECT nom, prenom, salaire FROM person WHERE salaire >= 2000 AND salaire <= 3000;

-- Ecrire une requete SQL qui permet de selectionner les personnes qui
-- habitent Marseille et dont le salaire est soit inferieur ou egal a 2000 soit
-- superieur ou egal a 2500.

SELECT nom, prenom 
FROM person
WHERE salaire <= 2000 OR salaire >= 2500;

-- Selectionne les personnes dont le nom de la ville contient  a 
SELECT * FROM person WHERE ville like '%a%';

-- Selectionne les personnes dont le nom de la ville commence par p 
SELECT * FROM person WHERE ville like 'p%';

-- Selectionne les personnes dont le nom de la ville fini par s
SELECT * FROM person WHERE ville like '%s';

-- Slectionne les personnes dont le nom dont le cinquière caractère est un d
SELECT nom FROM person WHERE nom like '____d%';


-- Selectionne les voitires dont l'id du propriétaire est non-null
-- cad, toutes les voitures qui ont un propriétaire 
-- Selectionne les personnes dont le nom de la ville commence par p 
SELECT *  FROM car WHERE id_person IS NOT NULL;

-- Utiliser la fonction IFNULL() pour remplcaer les valeurs nulles par une autre valeur
-- Selectionne les personnes dont le nom de la ville commence par p 
SELECT marque, IFNULL(id_person, 'pas propriétaire') AS propriétaire FROM car;

-- Ordonne le resultat selon le numéro du propriétaire
-- ORDER BY : ASC par défaut, sinon DESC pour un ordre décroissant

SELECT * FROM car WHERE id_person IS NOT NULL
ORDER BY id_person DESC;

-- Compte le nombre de véhicule pour chaque personne
-- Il faut les regrouper avec GROUP BY, ici selon la colonne id_person
SELECT id_person, COUNT(*) AS nombre_vehicule 
FROM car
WHERE id_person IS NOT NULL
GROUP BY id_person
HAVING vehicule > 1;

-- Fonctions d'agrrégation
-- COUNT()
-- MAX()
-- MIN()
-- SUM()
-- AVG()

-- Ecrire une requete SQL qui permet de compter la somme des salaires 
-- regroupe par ville
SELECT ville, SUM(salaire) AS montant_total
FROM person
GROUP BY ville;

SELECT id, nom, prenom, COUNT(id_person) AS Total
FROM person, car
WHERE person.id = car.id_person
GROUP BY id_person
	HAVING COUNT(id_person) = (
		SELECT MAX(mycount)
		FROM (
			SELECT id, nom, prenom, COUNT(id_person) mycount
			FROM person, car
			WHERE person.id = car.id_person
			GROUP BY id_person) as d);
