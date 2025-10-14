USE	biblioteca_anaclaragrizotto;	

-- SELECT (1)
SELECT titulo, descricao FROM Livro WHERE id_livro=3;

-- INSERT (1)
ALTER TABLE Livro ADD data_publicacao DATE, ADD edicao VARCHAR(50);
INSERT INTO Livro(isbn, titulo, descricao, data_publicacao, edicao) VALUES ('131718502702', 'Python', 'Livro de Python', '2023-04-24', '3ª edicao');
INSERT INTO Autor(nome) VALUES ('Eric Matthes');
INSERT INTO Categoria(nome) VALUES ('Tecnica');
INSERT INTO Livro_Autor(id_livro, id_autor) VALUES (11, 11);
INSERT INTO Livro_Categoria(id_livro, id_categoria) VALUES (11, 11);

-- UPDATE (4)
UPDATE Usuario SET email = 'teste@email.com' WHERE id_usuario = 1;

UPDATE Livro SET titulo = 'Curso Intensivo de Python: uma Introdução Prática e Baseada em Projetos à Programação' WHERE id_livro = 11;

ALTER TABLE Livro ADD status ENUM('ativo', 'inativo') DEFAULT 'ativo';
UPDATE Livro SET data_publicacao = '1999-08-18' WHERE id_livro = 7;
SET SQL_SAFE_UPDATES = 0;
UPDATE Livro SET status = 'inativo' WHERE data_publicacao < '2000-01-01';

-- DELETE (4)
DELETE FROM Emprestimo WHERE id_livro = 2;
DELETE FROM Livro_Autor WHERE id_livro = 2;
DELETE FROM Livro_Categoria WHERE id_livro = 2;
DELETE FROM Livro WHERE id_livro = 2;

INSERT INTO Usuario(nome, numero_identificacao, email, nivel_associacao) VALUES ('Teste Testador', 2025, 'lucas.almeida@email.com','Basico');
DELETE FROM Usuario WHERE id_usuario = 11;

ALTER TABLE Livro MODIFY COLUMN status ENUM('ativo', 'inativo', 'danificado');
UPDATE Livro SET status = 'danificado' WHERE id_livro = 1;
DELETE FROM Emprestimo WHERE id_livro = 1;
DELETE FROM Livro_Autor WHERE id_livro = 1;
DELETE FROM Livro_Categoria WHERE id_livro = 1;
DELETE FROM Livro WHERE id_livro = 1;

UPDATE Emprestimo SET data_emprestimo = '2020-08-15' WHERE id_emprestimo = 9;
DELETE FROM Emprestimo WHERE id_emprestimo = 9;



SELECT * FROM Emprestimo;
