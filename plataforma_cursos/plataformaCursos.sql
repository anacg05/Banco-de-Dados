CREATE DATABASE PlataformaCursos;
USE PlataformaCursos;

-- DROP DATABASE PlataformaCursos


-- TABELA DE PLANOS
CREATE TABLE Plano(
	id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL
);

-- TABELA DE ALUNOS
CREATE TABLE Aluno(
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    id_plano INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES Plano(id_plano)
);

-- TABELA DE PERFIL
CREATE TABLE Perfil(
	id_perfil INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT UNIQUE,
    foto VARCHAR(255),
    biografia TEXT,
    data_nascimento DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
);

-- TABELA DE CURSOS 
CREATE TABLE Curso(
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    descricao TEXT
);

-- TABELA DE MÓDULOS
CREATE TABLE Modulo(
	id_modulo INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    ordem INT NOT NULL,
    carga_horaria INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- TABELA DE PROFESSORES
CREATE TABLE Professor(
	id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

-- TABELA DE PROFESSOR_CURSO
CREATE TABLE Professor_Curso(
	id_professor_curso INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT NOT NULL,
    id_curso INT NOT NULL,
    papel ENUM('titular', 'tutor') NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
	FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)

);

-- TABELA INSCRIÇÃO
CREATE TABLE Inscricao(
	id_inscricao INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    data_inscricao DATE NOT NULL,
    situacao ENUM('ativa', 'concluida', 'trancada') NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
	FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)

);

-- PLANO
INSERT INTO Plano(nome, descricao) VALUES
('Básico', 'Acesso limitado aos cursos.'),
('Premium', 'Acesso a todos os cursos, suporte prioritário.'),
('Basico', 'Inclui mentorias exclusivas.');

-- ALUNO
INSERT INTO Aluno (nome, email, id_plano) VALUES
('Ana Souza', 'ana@email.com', 1),
('Bruno Lima', 'bruno@email.com', 2),
('Carla Dias', 'carla@email.com', 3);

-- PERFIL
INSERT INTO Perfil (id_aluno, foto, biografia, data_nascimento) VALUES
(1, 'ana.jpg', 'Amante de tecnologia e educação.', '1995-04-10'),
(2, 'bruno.png', 'Engenheiro e curioso por IA.', '1990-09-23'),
(3, 'carla.png', 'Apaixonada por design e arte.', '1998-12-02');

-- CURSO
INSERT INTO Curso (titulo, descricao) VALUES
('Introdução ao Python', 'Curso básico de programação em Python.'),
('Banco de Dados Relacional', 'Curso sobre SQL e modelagem de dados.'),
('Design UI/UX', 'Curso de fundamentos de experiência do usuário.');

-- MODULO
INSERT INTO Modulo (id_curso, titulo, ordem, carga_horaria) VALUES
(1, 'Variáveis e Tipos', 1, 50),
(1, 'Estruturas de Controle', 2, 60),
(2, 'Modelo Entidade-Relacionamento', 1, 40);

-- PROFESSOR
INSERT INTO Professor (nome, email) VALUES
('Marcos Silva', 'marcos@prof.com'),
('Fernanda Alves', 'fernanda@prof.com'),
('João Pereira', 'joao@prof.com');

-- PROFESSOR_CURSO
INSERT INTO Professor_Curso (id_professor, id_curso, papel) VALUES
(1, 1, 'Titular'),
(2, 2, 'Tutor'),
(3, 3, 'Titular');

-- INSCRIÇÃO
INSERT INTO Inscricao (id_aluno, id_curso, data_inscricao, situacao) VALUES
(1, 1, '2025-01-10', 'ativa'),
(2, 2, '2025-02-15', 'concluida'),
(3, 3, '2025-03-01', 'trancada');

SELECT * FROM Inscricao;