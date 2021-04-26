CREATE TABLE Etudiant(
	Matricule varchar(50) PRIMARY KEY,
    nom varchar(50),
	prenom varchar(50),
	DateNaissance date,
    Niveau varchar(50)
);

CREATE TABLE Cours(
	Code varchar(50) PRIMARY KEY,
    NomCours varchar(50),
	Enseignant varchar(50)
);

CREATE TABLE Examen(
	Matricule varchar(50),
    Code varchar(50),
	Note float,
    FOREIGN KEY (Matricule) REFERENCES Etudiant(Matricule),
    FOREIGN KEY (Code) REFERENCES Cours(Code),
    CONSTRAINT pk_examen PRIMARY KEY (Matricule, Code)
);


