-- DROP DATABASE IF EXISTS tp_sql_2_db;
CREATE DATABASE tp_sql_2_db;
-- Utilisation d'une bd
-- DROP TABLE IF EXISTS tp_sql_2_db;
USE tp_sql_2_db;

CREATE TABLE CLIENT(
	NOCLI int,
    NOMCLI varchar(50),
    RUECLI varchar(50),
    CPCLI varchar(50),
    VILLECLI varchar(50),
    CACLI int,
    PRIMARY KEY(NOCLI)
);

CREATE TABLE MATERIEL(
	NOMAT int,
    LIBMAT varchar(100),
    QTEMAT int,
    PVMAT int,
    PRIMARY KEY(NOMAT)
);

CREATE TABLE AFFAIRE(
	NOAFF int,
    NOMAT int,
    DATEAFF date,
    NBMAT int,
    NBLIV int,
    FOREIGN KEY (NOCLI) REFERENCES CLIENT(NOCLI),
    FOREIGN KEY (NOMAT) REFERENCES MATERIEL(NOMAT),
    PRIMARY KEY(NOAFF)
);

CREATE TABLE LIVRAISON(
	NOBL int,
    DATEEXP date,
    DATELIV date,
    QTELIV int,
    FOREIGN KEY (NOAFF) REFERENCES AFFAIRE(NOAFF),
    PRIMARY KEY(NOBL)
);

-- ISERTION DE DONNEES
INSERT INTO CLIENT VALUES
(1, 'Dupont Jaques', '8 Rue des Cordeliers', 13090, 'Aix En Provence', 56000),
(2, 'Dupuis Jean Jaques', '8 Rue Du Bois Nouveaus', 13100, 'Aix En Provence', 985000),
(3, 'Serra Albert', '5 Rue Leon Blum', 13090, 'Aix En Provence', 553223),
(4, 'Danna Sidonie', 'Quartier Saint Jean', 84130, 'Le Pontet', 812654),
(5, 'Sartous Robert', 'Rue De La Molle', 13100, 'Aix En Provence', 456258),
(6, 'Texede Jean', 'Rue De La Republique', '13200', 'Puyricard', 32000),
(7, 'Loiseau Gerard', 'Rue De La Grande Place', '13240', 'Meyreuil', 12000),
(8, 'Josserand Melodie', 'Avenue De l\'Europe', 13090, 'Aix En Provence', 75000),
(9, 'Roubaud Aurore', 'Rue Max Weber', 13700, 'Lambesc', 125000),
(10, 'Tamburini Franck', 'Boulevard De La Liberte', 1370, 'Saint Cannat', 453000),
(11, 'Parlos Jose', 'Chemin De La Bigotte', 13006, 'Marseille', 200000),
(12, 'Parlos Jose', 'Cchemin De La Bigotte', 13006, 'Marseille', 200000);

DELETE FROM MATERIEL;
INSERT INTO MATERIEL VALUES
-- (1, 'Perforateur A', 25, 3654),
(2, 'Electro Portatif', 15, 8975),
(3, 'Compresseur B', 30, 4658),
(4, 'Supresseur 45', 45, 6000),
(5, 'Electro Pompe', 60, 2985),
(6, 'Groupe Electrogene', 28, 15685),
(7, 'Pome Type H', 14, 4657),
(8, 'Marteau Piqueur', 145, 6189),
(9, 'Compresseur H', 25, 8000),
(10, 'Perforateur TTX', 42, 3589);


DELETE FROM AFFAIRE;
INSERT INTO AFFAIRE VALUES
-- (1, 1, 8, '2011-09-03', 50, 3)
(2, 5, 5, '2011-10-04', 9, 5),
(3, 8, 5, '2011-11-05', 50, 9),
(4, 7, 6, '2011-11-10', 26, 8),
(5, 1, 4, '2011-11-12', 50, 9),
(6, 1, 10, '2011-12-14', 30, 3),
(7, 2, 7, '2012-01-06', 10, 1),
(8, 2, 8, '2012-01-07', 50, 2),
(9, 1, 8, '2012-01-13', 30, 3);


DELETE FROM LIVRAISON;
INSERT INTO LIVRAISON VALUES
-- (1, 3, '2011-11-16', '2011-11-23', 10);
(2, 3, '2011-11-23', '2011-12-10', 3),
(3, 3, '2011-11-24', '2011-12-01', 2),
(4, 5, '2011-12-19', '2011-12-25', 5);


-- 1. Afficher la liste de tous les noms de clients avec l???adresse compl??te de leur
-- si??ge social, par ordre alphab??tique des noms. Visualiser le r??sultat de la
-- requ??te.

SELECT NOMCLI AS Nom_du_client, CONCAT(RUECLI, ' ', CPCLI, ' ', VILLECLI) AS Adresse
FROM CLIENT
ORDER BY NOMCLI ASC;

-- 2. Afficher la liste des clients de Marseille et d'Aix en Provence.
SELECT *
FROM CLIENT
WHERE VILLECLI = 'Aix en Provence' OR  VILLECLI = 'Marseille'; -- IN

-- 3. Afficher les mat??riels dont le prix est compris entre 4 000 et 15 000 ???.
SELECT *
FROM MATERIEL
WHERE PVMAT >= 4000 AND PVMAT <= 15000; -- BETWEEN

-- 4. Afficher les clients dont le nom commence par A
SELECT *
FROM CLIENT
WHERE NOMCLI LIKE 'A%';

-- 5. Afficher les clients dont le nom de famille est DUPONT ou DANNA
SELECT *
FROM CLIENT
WHERE NOMCLI LIKE 'DUPONT%' OR NOMCLI LIKE 'DANNA%';

-- 6. Afficher les noms et adresses des clients dont le nom commence par un D ou
-- un P, tels que leur si??ge social est ?? Aix en Provence et leur chiffre d???affaires est
-- sup??rieur ou ??gal ?? 50.000 ??? et inf??rieur ?? 100.000 ???.
SELECT NOMCLI AS Nom_du_client, CONCAT(RUECLI, CPCLI, VILLECLI) AS Adresse, CACLI AS chiffre_d_affaires
FROM CLIENT
WHERE (NOMCLI LIKE 'D%' OR NOMCLI LIKE 'P%') AND (VILLECLI = 'Aix en Provence') AND ( CACLI >= 50000 AND CACLI < 100000);

-- 7. Faites en sorte que les en-t??tes de colonnes du r??sultat de la requ??te
-- pr??c??dente soient explicites, par exemple : Nom du client au lieu de nomcli
 
 
 -- 8. Calculer le nombre total des mat??riels dont on dispose et le prix unitaire moyen des mat??riels que l???on fabrique (moyenne simple).
SELECT * FROM MATERIEL;

SELECT LIBMAT AS materiel, SUM(QTEMAT) AS Nombre_Total_Mat??riels, SUM(PVMAT) AS Total_Prix, AVG(PVMAT/QTEMAT) AS Prix_Unitaire_Moyen
FROM MATERIEL
GROUP BY materiel;

SELECT SUM(QTEMAT) AS Nombre_Total_Mat??riels, AVG(PVMAT/QTEMAT) AS Prix_Unitaire_Moyen
FROM MATERIEL;

-- correction
SELECT SUM(qtemat), AVG(pvmat)
FROM materiel;

-- Requ??tes s??lection multi-tables
-- 9. Afficher la liste des num??ros d???affaire avec pour chacune le nom du client
SELECT NOAFF AS num??ro_affaire, NOMCLI AS nom_client
FROM AFFAIRE a
JOIN CLIENT c ON a.NOCLI = c.NOCLI;

-- 10. Afficher la liste de tous les noms et les adresses des clients de l???entreprise,
-- avec, le cas ??ch??ant, leurs num??ros d???affaire. Dans le r??sultat, il peut y avoir un client sans affaire.

SELECT NOMCLI AS Nom_du_client, CONCAT(RUECLI, ' ', CPCLI, ' ', VILLECLI) AS Adresse
FROM CLIENT c
RIGHT JOIN AFFAIRE a ON c.NOCLI = a.NOCLI;

-- 11. Afficher les affaires r??alis??es dans les 50 derniers jours avec le nom du client concern??

SELECT a.NOAFF AS num??ro_affaire, NOMCLI AS nom_client, DATEDIFF(CURDATE(), DATEAFF) AS nb_jours
FROM AFFAIRE a
JOIN CLIENT c ON a.NOCLI = c.NOCLI
WHERE DATEDIFF(CURDATE(), DATEAFF) <= 50;

-- 12. Afficher la liste tri??e par ordre alphab??tique des noms de clients pour
-- lesquels une ou plusieurs affaires ont ??t?? r??alis??es dans les 50 derniers jours.
SELECT c.NOMCLI AS Nom_du_client, DATEDIFF(CURDATE(), DATEAFF) AS nb_jours
FROM CLIENT c
JOIN AFFAIRE a ON c.NOCLI = a.NOCLI
WHERE DATEDIFF(CURDATE(), DATEAFF) <= 50
ORDER BY NOMCLI;

-- 13. Afficher les num??ros d???affaire avec le nom du client, pour les livraisons dont
-- la date delivraison d??passe de plus de 10 jours la date d???exp??dition.
SELECT a.NOAFF AS num??ro_affaire, NOMCLI AS nom_client, DATEDIFF(CURDATE(), DATEEXP) AS nb_jours_expedition
FROM AFFAIRE a
JOIN CLIENT c ON a.NOCLI = c.NOCLI
JOIN LIVRAISON l ON a.NOAFF = l.NOAFF
WHERE DATEDIFF(CURDATE(), DATEEXP) >= 10;

-- 14. Compl??ter la requ??te pr??c??dente pour afficher, en plus, le nombre de jours de retard de livraison

SELECT a.NOAFF AS num??ro_affaire, NOMCLI AS nom_client, DATEDIFF(DATELIV, DATEEXP) - 10 AS nb_jours_retard_10
FROM AFFAIRE a
JOIN CLIENT c ON a.NOCLI = c.NOCLI
JOIN LIVRAISON l ON a.NOAFF = l.NOAFF
WHERE DATEDIFF(DATELIV, DATEEXP) >= 10;











