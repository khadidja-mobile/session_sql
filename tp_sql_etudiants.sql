-- 1.Afficher la liste des étudiants triés par ordre croissant de date de naissance.
    SELECT * FROM etudiant ORDER BY DateNaissance;

-- 2.Afficher tous les étudiants inscrits à M1 et tous les étudiants inscrits à M2.
    -- SELECT Nom, Prenom, Niveau FROM etudiant WHERE Niveau = 'M1';
    -- SELECT Nom, Prenom, Niveau FROM etudiant WHERE Niveau = 'M2';
    SELECT Nom, Prenom, Niveau FROM etudiant WHERE Niveau = 'M1' AND Niveau = 'M2';

-- 3.Afficher les matricules des étudiants qui ont passé l'examen du cours c2.
    SELECT Matricule FROM examen WHERE code ="c2";
    SELECT Matricule, Code FROM examen WHERE code ="c2";
 -- SELECT * FROM examen;
 
-- 4.Afficher les matricules de tous les étudiants qui ont passé l'examen du cours c1 
-- et de tous les étudiants qui ont passé l'examen du cours c2.
    SELECT Matricule FROM examen WHERE code ="c1" OR code ="c2";

-- 5.Afficher le matricule, code, note /20 et note /40 de tous les examens classés par ordre croissant de matricule et de code.
    SELECT Matricule, Code, Note AS note_sur_20
    FROM examen WHERE Note <= 20
    ORDER BY Code;
    SELECT Matricule, Code, Note AS note_sur_40
    FROM examen WHERE Note <= 40
    ORDER BY Code;

-- 6.Trouver la moyenne de notes de cours c2.
-- SELECT * FROM examen WHERE Code = 'c2';
   SELECT AVG(Note) AS Moyenne FROM examen WHERE Code = 'c2';

-- 7.Compter les examens passés par un étudiant (exemple avec matricule 'e1')
   SELECT Matricule, COUNT(Matricule) AS nb_examen FROM examen GROUP BY Matricule;

-- 8.Compter le nombre d'étudiants qui ont passé l'examen du cours c2.
-- SELECT COUNT(Matricule) AS nb_etudiant FROM cours WHERE Code ='c2';
   SELECT Code, COUNT(Matricule) AS nb_etudiant FROM examen WHERE Code = 'c2';
  
-- 9.Calculer la moyenne des notes d'un étudiant (exemple avec matricule 'e1').
    SELECT Matricule, AVG(Note) AS moyenne_etudiant FROM examen GROUP BY Matricule;
  
-- 10.Compter les examens passés par chaque étudiant.
    SELECT Matricule, COUNT(Code) AS nb_examen FROM examen GROUP BY Matricule;
  
-- 11.Calculer la moyenne des notes pour chaque étudiant.
   SELECT Matricule, AVG(Note) AS moyenne_etudiant FROM examen GROUP BY Matricule;
  
-- 12.La même au dessus, mais afficher seulement les étudiants (et leurs moyennes) dont lamoyenne est >= 15.
   SELECT Matricule, AVG(Note) AS moyenne_etudiant 
   FROM examen 
   WHERE Note >= 15
   GROUP BY Matricule;
   
 -- 13.Trouver la moyenne de notes de chaque cours.
    SELECT Code, AVG(Note) AS moyenne FROM examen GROUP BY Code;
  
  