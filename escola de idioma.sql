create database db_escola_de_idioma ;
use db_escola_de_idioma;


CREATE TABLE tb_aluno(
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_cadastro DATE NOT NULL,
    email_aluno VARCHAR(50) NOT NULL,
    telefone CHAR(11) NOT NULL,
    cpf_aluno CHAR(14) NOT NULL
);

INSERT INTO tb_aluno
(nome_aluno, data_nascimento, data_cadastro, email_aluno, telefone, cpf_aluno)
VALUES
('Ana Souza', '2005-02-21', '2026-01-10', 'ana@gmail.com', '11987654321', '123.456.789-01'),
('Carlos Lima', '2004-08-15', '2026-01-12', 'carlos@gmail.com', '11976543210', '234.567.890-12'),
('Mariana Alves', '2006-05-30', '2026-01-15', 'mariana@gmail.com', '11965432109', '345.678.901-23');


CREATE TABLE tb_professor(
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR(100) NOT NULL,
    email_institucional VARCHAR(50) NOT NULL,
    telefone CHAR(11) NOT NULL,
    disciplina VARCHAR(50) NOT NULL,
    data_contratacao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);


INSERT INTO tb_professor
(nome_professor, email_institucional, telefone, disciplina, data_contratacao, salario)
VALUES
('João Silva', 'joao@escola.com', '11999998888', 'Inglês', '2025-02-01', 4500.00),
('Maria Costa', 'maria@escola.com', '11988887777', 'Espanhol', '2025-03-15', 4700.00),
('Pedro Santos', 'pedro@escola.com', '11977776666', 'Francês', '2025-04-10', 5000.00);


CREATE TABLE tb_responsavel_aluno(
    id_responsavel INT AUTO_INCREMENT PRIMARY KEY,
    nome_responsavel VARCHAR(100) NOT NULL,
    telefone CHAR(11) NOT NULL,
    email_responsavel VARCHAR(50) NOT NULL,
    parentesco VARCHAR(30) NOT NULL
);

INSERT INTO tb_responsavel_aluno
(nome_responsavel, telefone, email_responsavel, parentesco)
VALUES
('José Souza', '11991234567', 'jose@gmail.com', 'Pai'),
('Claudia Lima', '11992345678', 'claudia@gmail.com', 'Mãe'),
('Roberto Alves', '11993456789', 'roberto@gmail.com', 'Pai');


CREATE TABLE tb_idioma(
    id_idioma INT AUTO_INCREMENT PRIMARY KEY,
    nome_idioma VARCHAR(50) NOT NULL,
    nivel VARCHAR(20) NOT NULL
);

INSERT INTO tb_idioma
(nome_idioma, nivel)
VALUES
('Inglês', 'Básico'),
('Espanhol', 'Intermediário'),
('Francês', 'Avançado');

-- Tabela Turma
CREATE TABLE tb_turma(
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(50) NOT NULL,
    horario VARCHAR(30) NOT NULL,
    sala VARCHAR(20) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    id_professor INT NOT NULL,
    id_idioma INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES tb_professor(id_professor),
    FOREIGN KEY (id_idioma) REFERENCES tb_idioma(id_idioma)
);

INSERT INTO tb_turma
(nome_turma, horario, sala, data_inicio, data_fim, id_professor, id_idioma)
VALUES
('Turma A', '08:00 - 10:00', 'Sala 01', '2026-02-01', '2026-06-30', 1, 1),
('Turma B', '14:00 - 16:00', 'Sala 02', '2026-02-01', '2026-06-30', 2, 2),
('Turma C', '19:00 - 21:00', 'Sala 03', '2026-02-01', '2026-06-30', 3, 3);


CREATE TABLE tb_matricula(
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    data_matricula DATE NOT NULL,
    situacao VARCHAR(20) NOT NULL,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES tb_aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES tb_turma(id_turma)
);
INSERT INTO tb_matricula
(data_matricula, situacao, id_aluno, id_turma)
VALUES
('2026-01-20', 'Ativa', 1, 1),
('2026-01-21', 'Ativa', 2, 2),
('2026-01-22', 'Ativa', 3, 3);
