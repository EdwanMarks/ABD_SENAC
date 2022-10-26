use dbvictor;

drop table if exists vendas; 
 
CREATE TABLE IF NOT EXISTS vendas  (
nameString CHAR(30), 
janeiro int, 
fevereiro int,
marco int,
id INTEGER PRIMARY KEY auto_increment
);

LOAD DATA INFILE 'csvImportTest.csv'
INTO TABLE vendas
FIELDS TERMINATED BY ','
