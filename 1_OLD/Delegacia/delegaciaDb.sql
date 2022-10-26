CREATE database delegaciaDB;
use delegaciaDB; 

CREATE TABLE criminoso (
    idCriminoso INT PRIMARY KEY,
    nome CHAR(50),
    cpf CHAR(50),
    endereco CHAR(150),
    telefone CHAR(15),
    caracteristicas CHAR(50)
);

CREATE TABLE vitima (
    idVitima INT PRIMARY KEY,
    nome CHAR(50),
    cpf CHAR(20),
    endereco CHAR(150),
    telefone CHAR(20),
    caracateristica CHAR(150)
);

CREATE TABLE crime (
    idCrime INT PRIMARY KEY,
    artigo INT,
    agravante CHAR(50),
    data DATE,
    hora TIME,
    local CHAR(50),
    caracteristica CHAR(150)
);

CREATE TABLE arma (
    idArma INT PRIMARY KEY,
    tipo CHAR(50),
    fabricante CHAR(50),
    numSerie INT,
    calibre CHAR(50),
    arma_TIPO INT
);

CREATE TABLE utilizada (
    fk_crime_idCrime INT,
    fk_arma_idArma INT
);

CREATE TABLE vitima_crime (
    fk_crime_idCrime INT,
    fk_vitima_idVitima INT
);

CREATE TABLE comete (
    fk_crime_idCrime INT,
    fk_criminoso_idCriminoso INT
);

CREATE TABLE faz (
    fk_vitima_idVitima INT,
    fk_criminoso_idCriminoso INT
);

CREATE TABLE utiliza (
    fk_criminoso_idCriminoso INT,
    fk_arma_idArma INT
);

CREATE TABLE fere (
    fk_arma_idArma INT,
    fk_vitima_idVitima INT
);
 
ALTER TABLE utilizada ADD CONSTRAINT FK_utilizada_1
    FOREIGN KEY (fk_crime_idCrime)
    REFERENCES crime (idCrime)
    ON DELETE RESTRICT;
 
ALTER TABLE utilizada ADD CONSTRAINT FK_utilizada_2
    FOREIGN KEY (fk_arma_idArma)
    REFERENCES arma (idArma)
    ON DELETE SET NULL;
 
ALTER TABLE vitima_crime ADD CONSTRAINT FK_vitima_crime_1
    FOREIGN KEY (fk_crime_idCrime)
    REFERENCES crime (idCrime)
    ON DELETE RESTRICT;
 
ALTER TABLE vitima_crime ADD CONSTRAINT FK_vitima_crime_2
    FOREIGN KEY (fk_vitima_idVitima)
    REFERENCES vitima (idVitima)
    ON DELETE RESTRICT;
 
ALTER TABLE comete ADD CONSTRAINT FK_comete_1
    FOREIGN KEY (fk_crime_idCrime)
    REFERENCES crime (idCrime)
    ON DELETE RESTRICT;
 
ALTER TABLE comete ADD CONSTRAINT FK_comete_2
    FOREIGN KEY (fk_criminoso_idCriminoso)
    REFERENCES criminoso (idCriminoso)
    ON DELETE RESTRICT;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_1
    FOREIGN KEY (fk_vitima_idVitima)
    REFERENCES vitima (idVitima)
    ON DELETE RESTRICT;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_2
    FOREIGN KEY (fk_criminoso_idCriminoso)
    REFERENCES criminoso (idCriminoso)
    ON DELETE RESTRICT;
 
ALTER TABLE utiliza ADD CONSTRAINT FK_utiliza_1
    FOREIGN KEY (fk_criminoso_idCriminoso)
    REFERENCES criminoso (idCriminoso)
    ON DELETE RESTRICT;
 
ALTER TABLE utiliza ADD CONSTRAINT FK_utiliza_2
    FOREIGN KEY (fk_arma_idArma)
    REFERENCES arma (idArma)
    ON DELETE SET NULL;
 
ALTER TABLE fere ADD CONSTRAINT FK_fere_1
    FOREIGN KEY (fk_arma_idArma)
    REFERENCES arma (idArma)
    ON DELETE SET NULL;
 
ALTER TABLE fere ADD CONSTRAINT FK_fere_2
    FOREIGN KEY (fk_vitima_idVitima)
    REFERENCES vitima (idVitima)
    ON DELETE SET NULL;