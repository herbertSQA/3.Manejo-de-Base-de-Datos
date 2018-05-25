create database libreria
go
create table editoras(
	clave  varchar(6) unique not null,
	nombre varchar(25)not null
)
go
create table autores(
	clave  varchar(6) unique not null,
	clv_editora varchar(6)not null,
	nombre varchar(25)not null,
	CONSTRAINT autores_ibfk_1 FOREIGN KEY (clv_editora) REFERENCES editoras (clave)
)
go
create table libros(
	clave  varchar(6) unique not null,
	clv_editora varchar(6)not null,
	clv_autor varchar(6)not null,
	nombre varchar(25)not null
	CONSTRAINT libros_ibfk_3 FOREIGN KEY (clv_editora) REFERENCES editoras (clave),
	CONSTRAINT libros_ibfk_2 FOREIGN KEY (clv_autor) REFERENCES autores (clave)
)
/*3.1 Cuantos libros ha escrito o colaborado cierto autor*/
SELECT * FROM libros INNER JOIN autores ON libros.clv_autor = autores.clave  AND autores.nombre = 'samanta'
/*3.2 Cuantos libros ha editado una casa editora*/
SELECT * FROM libros INNER JOIN editoras ON libros.clv_editora = editoras.clave WHERE editoras.nombre ='Ed_Sociales'
/*3.4 Con cuales autores ha trabajado una casa editora*/
SELECT autores.nombre FROM autores INNER JOIN editoras ON autores.clv_editora = editoras.clave WHERE editoras.nombre = 'Ed_Sociales'
/*3.4 Con cuales autores no ha trabajado una casa editora*/
SELECT autores.nombre FROM autores INNER JOIN editoras ON autores.clv_editora != editoras.clave WHERE editoras.nombre = 'Ed_Sociales'