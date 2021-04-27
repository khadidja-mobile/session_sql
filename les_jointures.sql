-- Les jointures

-- Pour les proprietaires des vehicules, on affichait chaque fois 
-- le numero.
-- Pour l’utilisateur, il serait mieux de connaıtre les nom et prenom
-- que le numero.
-- Les nom et prenom sont dans la table personne.

-- Deux types de jointure

-- Jointure implicite : Avec la clause WHERE

SELECT nom, prenom, ville, 	marque, modele
FROM person p, 				car c
WHERE p.id = 				c.id_person;

-- Jointure Explicite : Avec la clause JOIN ... ON

-- JOIN ... ON  = renvoie les lignes en cas de correspondance avec les deux tables

SELECT nom, prenom, ville, 	marque, modele
FROM person p
JOIN car c ON p.id = c.id_person;

-- LEFT JOIN ... ON = Renvoie toutes les lignes de la table de gauche
-- meme s'il n'ya aucune corresponda,ce avec la table de droite
SELECT nom, prenom, ville, 	marque, modele
FROM person p
LEFT JOIN car c ON p.id = c.id_person;

-- RIGHT JOIN ... ON = Renvoie toutes les lignes de la table de droite
-- meme s'il n'ya aucune corresponda,ce avec la table de gauche
SELECT nom, prenom, ville, 	marque, modele
FROM person p
RIGHT JOIN car c ON p.id = c.id_person;





