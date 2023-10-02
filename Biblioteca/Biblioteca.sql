CREATE DATABASE biblioteca
USE biblioteca

-- Tabela dos usuários
CREATE TABLE usuarios (
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Endereco VARCHAR(255)
)

-- Tabela dos autores
CREATE TABLE autores (
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nome VARCHAR(255) NOT NULL
)

-- Tabela das editoras
CREATE TABLE editoras (
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nome VARCHAR(255) NOT NULL
)

-- Tabela das categorias
CREATE TABLE categorias (
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CodigoCategoria INT,
	Nome VARCHAR(255) NOT NULL
)

-- Tabela dos livros
CREATE TABLE livros (
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Titulo VARCHAR(255) NOT NULL,
	CategoriaID INT,
	FOREIGN KEY (CategoriaID) REFERENCES categorias(ID),
	AutorID INT,
	FOREIGN KEY (AutorID) REFERENCES autores(ID),
	EditoraID INT,
	FOREIGN KEY (EditoraID) REFERENCES editoras(ID)
)

-- Tabela dos empréstimos
CREATE TABLE emprestimos (
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	UsuarioID INT,
	FOREIGN KEY (UsuarioID) REFERENCES usuarios(ID),
	LivroID INT,
	FOREIGN KEY (LivroID) REFERENCES livros(ID),
	DataEmprestimo DATE,
	DataDevolucao DATE
)

-- Tabela das reservas
CREATE TABLE reservas (
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	UsuarioID INT,
	FOREIGN KEY (UsuarioID) REFERENCES usuarios(ID),
	LivroID INT,
	FOREIGN KEY (LivroID) REFERENCES livros(ID),
	DataReserva DATE,
	DataDisponivel DATE
)
