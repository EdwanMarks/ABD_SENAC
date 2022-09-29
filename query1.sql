CREATE DATABASE dbVictor;

create table dbVictor.funcionario(
	idFuncionario int primary key,
	nome char(50) not null, 
    sobrenome char(50),
    cpf char(12) not null, 
    funcao char(20),
    salario float
);

create table dbVictor.cliente(
	idCliente int primary key,
	nome char(50) not null, 
    sobrenome char(50),
    cpf char(12) not null
);

create table dbVictor.produto(
	idProduto int primary key,
	nome char(50) not null, 
    quantidade int default 0
);
