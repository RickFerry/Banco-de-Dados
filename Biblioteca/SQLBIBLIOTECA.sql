CREATE DATABASE BIBLIOTECA
GO
USE BIBLIOTECA

CREATE TABLE [AUTOR](
ID_AUTOR INT NOT NULL,
NOME_AUTOR VARCHAR(100) NOT NULL
PRIMARY KEY (ID_AUTOR)
)

CREATE TABLE [EDITORA](
ID_EDITORA INT NOT NULL,
NOME_EDITORA VARCHAR(100)
PRIMARY KEY (ID_EDITORA)
)

CREATE TABLE [LIVRO](
ID_LIVRO INT NOT NULL,
TITULO VARCHAR(100),
EDITORAID_EDITORA INT NOT NULL
PRIMARY KEY (ID_LIVRO)
FOREIGN KEY (EDITORAID_EDITORA) REFERENCES [EDITORA](ID_EDITORA)
)

CREATE TABLE [AUTOR_LIVRO](
AUTORID_AUTOR INT NOT NULL,
LIVROID_LIVRO INT NOT NULL
PRIMARY KEY (AUTORID_AUTOR, LIVROID_LIVRO)
FOREIGN KEY (AUTORID_AUTOR) REFERENCES [AUTOR](ID_AUTOR),
FOREIGN KEY (LIVROID_LIVRO) REFERENCES [LIVRO](ID_LIVRO)
)

CREATE TABLE [EXEMPLAR](
ID_EXEMPLAR INT NOT NULL,
LIVROID_LIVRO INT NOT NULL
PRIMARY KEY (ID_EXEMPLAR)
FOREIGN KEY (LIVROID_LIVRO) REFERENCES [LIVRO](ID_LIVRO)
)

CREATE TABLE [BIBLIOTECARIA](
ID_BIBLIOTECARIA INT NOT NULL,
NOME VARCHAR(100) NOT NULL
PRIMARY KEY (ID_BIBLIOTECARIA)
)

CREATE TABLE [ESTAGIARIA](
BIBLIOTECARIAID_BIBLIOTECARIA INT NOT NULL,
INSTITUICAO VARCHAR(100) NOT NULL,
ID_SUPERVISORA INT NOT NULL
PRIMARY KEY (BIBLIOTECARIAID_BIBLIOTECARIA)
FOREIGN KEY (BIBLIOTECARIAID_BIBLIOTECARIA) REFERENCES [BIBLIOTECARIA](ID_BIBLIOTECARIA),
FOREIGN KEY (ID_SUPERVISORA) REFERENCES [BIBLIOTECARIA](ID_BIBLIOTECARIA)
)

CREATE TABLE [CLIENTE](
ID_CLIENTE INT NOT NULL,
NOME_CLIENTE VARCHAR(100) NOT NULL
PRIMARY KEY (ID_CLIENTE)
)

CREATE TABLE [EMPRESTIMO](
EXEMPLARID_EXEMPLAR INT NOT NULL,
CLIENTEID_CLIENTE INT NOT NULL,
BIBLIOTECARIAID_BIBLIOTECARIA INT NOT NULL,
DATA_DEVOLUCAO DATE NOT NULL,
VALOR FLOAT NOT NULL
PRIMARY KEY (DATA_DEVOLUCAO, EXEMPLARID_EXEMPLAR, CLIENTEID_CLIENTE, 
BIBLIOTECARIAID_BIBLIOTECARIA)
FOREIGN KEY (EXEMPLARID_EXEMPLAR) REFERENCES [EXEMPLAR](ID_EXEMPLAR),
FOREIGN KEY (CLIENTEID_CLIENTE) REFERENCES [CLIENTE](ID_CLIENTE),
FOREIGN KEY (BIBLIOTECARIAID_BIBLIOTECARIA) REFERENCES [BIBLIOTECARIA](ID_BIBLIOTECARIA)
)