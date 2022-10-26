CREATE DATABASE Q1;
USE Q1;

CREATE TABLE sala (
    idSala INTEGER PRIMARY KEY,
    capacidade INTEGER,
    tipo CHAR(50),
    tamanho DECIMAL,
    temperatura DECIMAL,
    classificao REAL
);

CREATE TABLE filme (
    idFilme INTEGER PRIMARY KEY,
    titulo CHAR(50),
    diretor CHAR(50),
    imagem CHAR(50),
    classificacao REAL,
    duracao FLOAT,
    genero CHAR(50)
);

CREATE TABLE seccao (
    idSeccao INTEGER PRIMARY KEY,
    horario FLOAT,
    data DATE,
    valor FLOAT,
    fk_filme_idFilme INTEGER,
    fk_sala_idSala INTEGER
);

CREATE TABLE cinema (
    idCinema INTEGER,
    nome CHAR(50),
    endereco CHAR(50),
    cnpj CHAR(50)
);
 
ALTER TABLE seccao ADD CONSTRAINT FK_seccao_2
    FOREIGN KEY (fk_filme_idFilme)
    REFERENCES filme (idFilme)
    ON DELETE CASCADE;
 
ALTER TABLE seccao ADD CONSTRAINT FK_seccao_3
    FOREIGN KEY (fk_sala_idSala)
    REFERENCES sala (idSala)
    ON DELETE CASCADE;