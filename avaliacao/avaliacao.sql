CREATE DATABASE manutencao;
USE manutencao;
-- drop database manutencao;

CREATE TABLE Setor (
    id_setor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE Equipamento (
    id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_setor INT NOT NULL,
    FOREIGN KEY (id_setor) REFERENCES Setor(id_setor)
);

CREATE TABLE Tecnico (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    descricao_conhecimento TEXT
);

CREATE TABLE Peca (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    codigo_peca VARCHAR(50) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100)
);

CREATE TABLE Manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_equipamento INT NOT NULL,
    data_manutencao_feita DATETIME NOT NULL,
    status ENUM('aberta','em andamento','concluida') NOT NULL,
    tipo_manutencao ENUM('corretiva','preventiva') NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES Equipamento(id_equipamento)
);

CREATE TABLE Tecnico_Manutencao (
    id_manutencao INT NOT NULL,
    id_tecnico INT NOT NULL,
    PRIMARY KEY (id_manutencao, id_tecnico),
    FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id_manutencao),
    FOREIGN KEY (id_tecnico) REFERENCES Tecnico(id_tecnico)
);

CREATE TABLE Peca_Manutencao (
    id_manutencao INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_manutencao, id_peca),
    FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id_manutencao),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);

CREATE TABLE Laudo_Tecnico (
    id_laudo INT AUTO_INCREMENT PRIMARY KEY,
    id_manutencao INT NOT NULL UNIQUE,
    observacao TEXT,
    data_laudo DATETIME NOT NULL,
    resultado VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id_manutencao)
);

CREATE TABLE Agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    id_equipamento INT NOT NULL UNIQUE,
    data_proxima_manutencao DATETIME NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES Equipamento(id_equipamento)
);

-- Setor
INSERT INTO Setor (nome, descricao) VALUES
('Produção', 'Setor de produção de bens'),
('Manutenção', 'Setor responsável pela manutenção'),
('Logística', 'Setor de transporte');

-- Equipamento
INSERT INTO Equipamento (nome, id_setor) VALUES
('Torno Mecânico', 1),
('Esteira Transportadora', 3),
('Compressor de Ar', 2);

-- Técnico
INSERT INTO Tecnico (nome, email, descricao_conhecimento) VALUES
('Carlos Silva', 'carlos.silva@empresa.com', 'Especialista em manutenção mecânica'),
('Ana Paula', 'ana.paula@empresa.com', 'Técnica em manutenção elétrica'),
('João Souza', 'joao.souza@empresa.com', 'Conhecimento geral em equipamentos industriais');

-- Peça
INSERT INTO Peca (codigo_peca, nome, fabricante) VALUES
('P001', 'Filtro de Ar', 'Fabricante A'),
('P002', 'Correia', 'Fabricante B'),
('P003', 'Parafuso M8', 'Fabricante C');

-- Manutencao
INSERT INTO Manutencao (id_equipamento, data_manutencao_feita, status, tipo_manutencao) VALUES
(1, '2025-09-15 08:00:00', 'concluida', 'corretiva'),
(2, '2025-09-10 09:30:00', 'concluida', 'preventiva'),
(3, '2025-09-12 14:00:00', 'em andamento', 'corretiva');

-- Tecnico_Manutencao
INSERT INTO Tecnico_Manutencao (id_manutencao, id_tecnico) VALUES
(1, 1),
(2, 2),
(2, 3);

-- Peca_Manutencao
INSERT INTO Peca_Manutencao (id_manutencao, id_peca, quantidade) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 4);

-- Laudo_Tecnico
INSERT INTO Laudo_Tecnico (id_manutencao, observacao, data_laudo, resultado) VALUES
(1, 'Troca de filtro e limpeza geral.', '2025-09-15 12:00:00', 'Manutenção concluída com sucesso'),
(2, 'Revisão preventiva da esteira, substituição da correia.', '2025-09-10 15:00:00', 'Equipamento em boas condições'),
(3, 'Verificação de vazamentos no compressor.', '2025-09-12 16:00:00', 'Manutenção em andamento');

-- Agendamento
INSERT INTO Agendamento (id_equipamento, data_proxima_manutencao) VALUES
(1, '2025-11-15 09:00:00'),
(2, '2025-11-10 10:00:00'),
(3, '2025-11-12 11:00:00');


SELECT * FROM Setor;
SELECT * FROM Equipamento;
SELECT * FROM Tecnico;
SELECT * FROM Peca;
SELECT * FROM Manutencao;
SELECT * FROM Tecnico_Manutencao;
SELECT * FROM Peca_Manutencao;
SELECT * FROM Laudo_Tecnico;
SELECT * FROM Agendamento;
