USE biblioteca

-- Inserindo um usuário
INSERT INTO usuarios (Nome, Endereco) VALUES ('Danilo', 'Aspen Mountain - Gramado / RS')
INSERT INTO usuarios (Nome, Endereco) VALUES ('Raisa', 'Canoas / RS')
INSERT INTO usuarios (Nome, Endereco) VALUES ('Hellen', 'Sant Ana do Livramento / RS')

-- Inserindo um autor
INSERT INTO autores (Nome) VALUES ('Rick Riordan')
INSERT INTO autores (Nome) VALUES ('Joanne Rowling')

-- Inserindo uma editora
INSERT INTO editoras (Nome) VALUES ('Editora Intrínseca')
INSERT INTO editoras (Nome) VALUES ('Editora Rocco')

-- Inserindo uma categoria
INSERT INTO categorias (CodigoCategoria, Nome) VALUES (1, 'Fantasia')
INSERT INTO categorias (CodigoCategoria, Nome) VALUES (2, 'Mitologia Grega')

-- Inserindo um livro
INSERT INTO livros (Titulo, CategoriaID, AutorID, EditoraID) VALUES ('Percy Jackson e o Ladrão de Raios', 2, 1, 1)
INSERT INTO livros (Titulo, CategoriaID, AutorID, EditoraID) VALUES ('Harry Potter e a Pedra Filosofal', 1, 2, 2)

-- Emprestando um livro
INSERT INTO emprestimos (UsuarioID, LivroID, DataEmprestimo, DataDevolucao) VALUES (2, 1, '20/12/2023', '22/12/2023')
INSERT INTO emprestimos (UsuarioID, LivroID, DataEmprestimo, DataDevolucao) VALUES (1, 2, '20/12/2023', '26/12/2023')

-- Reservando um livro
INSERT INTO reservas (UsuarioID, LivroID, DataReserva, DataDisponivel) VALUES (3, 2, '23/12/2023', '27/12/2023')

-- Exemplos de uso:

-- Selecionando um livro emprestado, contendo informações do usuário, título do livro, nome do autor e nome da editora
SELECT
	e.UsuarioID,
	u.Nome AS NomeUsuario,
	l.Titulo AS LivroEmprestado,
	a.Nome AS NomeAutor,
	ed.Nome AS NomeEditora,
	e.DataDevolucao
FROM
	emprestimos e
INNER JOIN usuarios u ON e.UsuarioID = u.ID
INNER JOIN livros l ON e.LivroID = l.ID
INNER JOIN autores a ON l.AutorID = a.ID
INNER JOIN editoras ed ON l.EditoraID = ed.ID

-- Selecionando os livros emprestados com informações do usuário e a reserva deste livro
SELECT
	e1.UsuarioID AS UsuarioEmprestimo,
	u1.Nome AS NomeUsuarioEmprestimo,
	l.Titulo AS TituloLivroEmprestado,
	e1.DataDevolucao AS DataDevolucao,
	r.UsuarioID AS UsuarioReserva,
	u2.Nome AS NomeUsuarioReserva,
	r.DataDisponivel AS DataReservada
FROM
    emprestimos e1
INNER JOIN usuarios u1 ON e1.UsuarioID = u1.ID
INNER JOIN livros l ON e1.LivroID = l.ID
LEFT JOIN reservas r ON l.ID = r.LivroID
LEFT JOIN usuarios u2 ON r.UsuarioID = u2.ID
