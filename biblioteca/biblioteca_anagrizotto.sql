-- BIBLIOTECA

CREATE DATABASE biblioteca_anaclaragrizotto;
USE	biblioteca_anaclaragrizotto;				-- usa
-- DROP DATABASE biblioteca_anaclaragrizotto

CREATE TABLE Livro(
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(255) UNIQUE NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT
    
);


CREATE TABLE Categoria(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
    
);


CREATE TABLE Livro_Categoria(
    id_livro_categoria INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT,
    id_livro INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);



CREATE TABLE Autor(
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nascimento DATE,
    biografia TEXT
    
);

CREATE TABLE Livro_Autor(
	id_livro_autor INT PRIMARY KEY AUTO_INCREMENT,
    id_autor INT,
    id_livro INT,
	FOREIGN KEY (id_autor) REFERENCES Autor(id_autor),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
    
);

CREATE TABLE Usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    numero_identificacao INT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    data_cadastro DATE,
    nivel_associacao ENUM('Basico', 'Premium', 'VIP') NOT NULL
    
);

CREATE TABLE Emprestimo(
	id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_livro INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro),
    data_emprestimo DATE NOT NULL,
	data_limite DATE NOT NULL,
    data_devolucao DATE
);



INSERT INTO Livro(isbn, titulo, descricao)
VALUES
	('9788535914849', '1984', 'Romance distópico de George Orwell que retrata um regime totalitário onde o Estado vigia todos os aspectos da vida dos cidadãos.'), 
	('9780061120084', 'To Kill a Mockingbird (O Sol é para Todos)', 'Clássico de Harper Lee que aborda racismo e injustiça no sul dos EUA, visto pelos olhos de uma criança.'),
	('9788556510970', 'Sapiens: Uma Breve História da Humanidade', 'Obra de Yuval Noah Harari que explora a história da espécie humana desde os primeiros hominídeos até a era moderna.'),
	('9788547001085', 'O Poder do Hábito', 'Charles Duhigg explica como os hábitos funcionam, como são formados e como podem ser mudados.'),
	('9788578270698', 'A Menina que Roubava Livros', 'História comovente de Markus Zusak sobre uma garota vivendo na Alemanha nazista, narrada pela Morte.'),
	('9786555320324', 'A Paciente Silenciosa', 'Thriller psicológico de Alex Michaelides sobre uma mulher que para de falar após matar o marido — e o terapeuta que tenta descobrir por quê.'),
	('9788595083276', 'O Milagre da Manhã', 'Hal Elrod apresenta uma rotina matinal capaz de transformar qualquer área da vida pessoal e profissional.'),
	('9788501112500', 'It: A Coisa', 'Um dos maiores sucessos de Stephen King, em que um grupo de amigos enfrenta uma entidade maligna que assume a forma de seus piores medos.'),
	('9788595080800', 'Essencialismo: A disciplinada busca por menos', 'Greg McKeown ensina como focar no que realmente importa, eliminando o excesso de tarefas e distrações.'),
	('9786588437532', 'As 5 Linguagens do Amor', 'Gary Chapman explora os diferentes modos como as pessoas dão e recebem amor, promovendo relacionamentos mais saudáveis.');

INSERT INTO Categoria(nome)
VALUES
	('Ficção / Distopia / Romance político'),
	('Ficção / Drama / Romance histórico'),
	('Não Ficção / História / Antropologia'),
	('Não Ficção / Desenvolvimento pessoal / Psicologia'),
	('Ficção / Romance histórico / Drama'),
	('Ficção / Thriller psicológico / Suspense'),
	('Não Ficção / Desenvolvimento pessoal / Autoajuda'),
	('Ficção / Terror / Suspense'),
	('Não Ficção / Produtividade / Desenvolvimento pessoal'),
	('Não Ficção / Relacionamentos / Autoajuda');

INSERT INTO Autor(nome, nascimento, biografia)
VALUES
	('George Orwell', '1903-06-25', 'Escritor e jornalista inglês, famoso por obras distópicas como "1984" e "A Revolução dos Bichos".'),
	('Harper Lee', '1926-04-28', 'Escritora americana conhecida pelo romance clássico "To Kill a Mockingbird".'),
	('Yuval Noah Harari', '1976-02-24', 'Historiador israelense e autor de best-sellers que exploram a história e o futuro da humanidade.'),
	('Charles Duhigg', '1974-12-02', 'Jornalista premiado e autor especializado em psicologia e hábitos humanos.'),
	('Markus Zusak', '1975-06-23', 'Escritor australiano, autor de "A Menina que Roubava Livros".'),
	('Alex Michaelides', '1977-09-27', 'Autor britânico conhecido por thrillers psicológicos, como "A Paciente Silenciosa".'),
	('Hal Elrod', '1979-05-30', 'Autor e palestrante americano focado em desenvolvimento pessoal e rotinas matinais.'),
	('Stephen King', '1947-09-21', 'Mestre do horror e suspense, autor prolífico com inúmeras obras adaptadas para cinema e TV.'),
	('Greg McKeown', '1977-06-08', 'Escritor e consultor que defende a simplicidade e foco no essencial.'),
	('Gary Chapman', '1938-01-10', 'Conselheiro e autor americano, conhecido por "As 5 Linguagens do Amor".');

INSERT INTO Usuario(nome, numero_identificacao, email, data_cadastro, nivel_associacao)
VALUES
	('Lucas Almeida', 1001, 'lucas.almeida@email.com', '2023-01-15', 'Basico'),
	('Marina Costa', 1002, 'marina.costa@email.com', '2022-08-30', 'Premium'),
	('Rafael Souza', 1003, 'rafael.souza@email.com', '2021-11-10', 'Basico'),
	('Juliana Fernandes', 1004, 'juliana.fernandes@email.com', '2023-05-20', 'VIP'),
	('Thiago Ribeiro', 1005, 'thiago.ribeiro@email.com', '2020-12-01', 'Premium'),
	('Camila Martins', 1006, 'camila.martins@email.com', '2022-03-25', 'Basico'),
	('Eduardo Santos', 1007, 'eduardo.santos@email.com', '2021-07-14', 'VIP'),
	('Fernanda Lima', 1008, 'fernanda.lima@email.com', '2023-02-17', 'Basico'),
	('Gabriel Oliveira', 1009, 'gabriel.oliveira@email.com', '2020-10-05', 'Premium'),
	('Isabela Pereira', 1010, 'isabela.pereira@email.com', '2022-09-12', 'Basico');

INSERT INTO Emprestimo(id_usuario, id_livro, data_emprestimo, data_limite, data_devolucao)
VALUES
	(1, 1, '2025-08-01', '2025-08-15', '2025-08-14'),
	(2, 2, '2025-08-05', '2025-08-19', NULL),
	(3, 3, '2025-07-20', '2025-08-03', '2025-08-01'),
	(4, 4, '2025-08-10', '2025-08-24', NULL),
	(5, 5, '2025-07-25', '2025-08-08', '2025-08-09'),
	(6, 6, '2025-08-03', '2025-08-17', NULL),
	(7, 7, '2025-07-30', '2025-08-13', '2025-08-13'),
	(8, 8, '2025-08-08', '2025-08-22', NULL),
	(9, 9, '2025-08-01', '2025-08-15', '2025-08-15'),
	(10, 10, '2025-07-28', '2025-08-11', '2025-08-10');

INSERT INTO Livro_Autor (id_livro, id_autor) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10);

INSERT INTO Livro_Categoria (id_livro, id_categoria) VALUES
	(1, 1),   -- 1984 - Ficção / Distopia / Romance político
	(2, 2),   -- To Kill a Mockingbird - Ficção / Drama / Romance histórico
	(3, 3),   -- Sapiens - Não Ficção / História / Antropologia
	(4, 4),   -- O Poder do Hábito - Não Ficção / Desenvolvimento pessoal / Psicologia
	(5, 5),   -- A Menina que Roubava Livros - Ficção / Romance histórico / Drama
	(6, 6),   -- A Paciente Silenciosa - Ficção / Thriller psicológico / Suspense
	(7, 7),   -- O Milagre da Manhã - Desenvolvimento pessoal / Autoajuda
	(8, 8),   -- It: A Coisa - Ficção / Terror / Suspense
	(9, 9),   -- Essencialismo - Produtividade / Desenvolvimento pessoal
	(10, 10); -- As 5 Linguagens do Amor - Relacionamentos / Autoajuda

SELECT * FROM Livro;
SELECT * FROM Autor;
SELECT * FROM Categoria;
SELECT * FROM Emprestimo;
SELECT * FROM Usuario;
SELECT * FROM Livro_Autor;
SELECT * FROM Livro_Categoria;
