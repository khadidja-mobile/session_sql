DROP DATABASE IF EXISTS tp2_db;
CREATE DATABASE IF NOT EXISTS tp2_db; 

USE tp2_db;

CREATE TABLE `client` (
  `NOCLI` int(11) NOT NULL,
  `NOMCLI` text,
  `RUECLI` text,
  `CPCLI` int(11) DEFAULT NULL,
  `VILLECLI` text,
  `CACLI` int(11) DEFAULT NULL,
  PRIMARY KEY (`NOCLI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `materiel` (
  `NOMAT` int(11) NOT NULL,
  `LIBMAT` text,
  `QTEMAT` int(11) DEFAULT NULL,
  `PVMAT` int(11) DEFAULT NULL,
  PRIMARY KEY (`NOMAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `affaire` (
  `NOAFF` int(11) NOT NULL,
  `NOCLI` int(11) NOT NULL,
  `NOMAT` int(11) NOT NULL,
  `DATAFF` text,
  `NBMAT` int(11) DEFAULT NULL,
  `NBLIV` int(11) DEFAULT NULL,
  PRIMARY KEY (`NOAFF`),
  KEY `fk_affaire_client_idx` (`NOCLI`),
  KEY `fk_affaire_materiel1_idx` (`NOMAT`),
  CONSTRAINT `fk_affaire_client` FOREIGN KEY (`NOCLI`) REFERENCES `client` (`NOCLI`),
  CONSTRAINT `fk_affaire_materiel1` FOREIGN KEY (`NOMAT`) REFERENCES `materiel` (`NOMAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `livraison` (
  `NOBL` int(11) NOT NULL,
  `NOAFF` int(11) NOT NULL,
  `DATEXP` text,
  `DATLIV` text,
  `QTELIV` int(11) DEFAULT NULL,
  PRIMARY KEY (`NOBL`),
  KEY `fk_livraison_affaire1_idx` (`NOAFF`),
  CONSTRAINT `fk_livraison_affaire1` FOREIGN KEY (`NOAFF`) REFERENCES `affaire` (`NOAFF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
