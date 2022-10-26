create database projeto_livros;

use projeto_livros; 

create table livros (
	pk_id_livro integer primary key auto_increment,
	titulo char(50),
    autor char(30),
    sexo char(2),
    num_paginas int,
    valor float,
	editora char(30),
    estado char(2), 
    ano year
);

insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano) 
values ('Livro 1', 'Autor 1', 'M', 450, 39.99, 'Editora A', 'SP', 2022);
insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano)
 values ('Livro 2', 'Autor 2', 'F', '578', '29.99', 'Editora B', 'RJ', '2018'); 
insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano)
 values ('Livro 3', 'Autor 3', 'M', '321', '19.99', 'Editora C', 'RJ', '2017'); 
insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano)
 values ('Livro 4', 'Autor 4', 'F', '153', '39.99', 'Editora A', 'CE', '2000'); 
insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano)
values ('Livro 5', 'Autor 1', 'M', '147', '77.99', 'Editora B', 'DF', '1998'); 
insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano)
values ('Livro 6', 'Autor 2', 'F', '963', '89.99', 'Editora C', 'GO', '2003'); 
insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano)
values ('Livro 7', 'Autor 3', 'M', '654', '29.99', 'Editora A', 'SP', '1997'); 
insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano)
 values ('Livro 8', 'Autor 4', 'F', '321', '8.99', 'Editora B', 'SP', '1698'); 
insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano)
values ('Livro 9', 'Autor 1', 'M', '581', '44.99', 'Editora C', 'RS', '2020'); 
insert into livros (titulo, autor, sexo, num_paginas, valor, editora, estado, ano)
values ('Livro 10', 'Autor 2', 'F', '450', '39.99', 'Editora A', 'MG', '2017'); 

/*Todos os  dados*/
select * from livros;

/*'Nome do livro e da editora */
select titulo, editora from livros;

/*Nome do livro e UF publicado por homens */
select titulo, estado from livros where sexo ='M';

/*Nome do livro e num páginas publicado por mulheres*/
select titulo, num_paginas from livros where sexo='F';

/*Nome do livro, valor das editoras de sao paulo*/
select titulo, valor, editora from livros where estado='SP';

/*Autores Masculinos que tiveram livros publicados em SP ou RJ*/
select autor from livros where sexo='M' and estado='SP' or estado='RJ'; 