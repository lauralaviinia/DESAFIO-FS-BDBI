CREATE DATABASE faculdade;
USE faculdade;

#CRIANDO AS TABELAS

CREATE TABLE departamento
(
    id_departamento INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    diretor VARCHAR(80) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    localizacao VARCHAR(255),
    PRIMARY KEY (id_departamento)
);

CREATE TABLE aluno 
(
    id_aluno INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    curso VARCHAR(80) NOT NULL,
    nome VARCHAR(80),
    dataNasc DATE NOT NULL,
    PRIMARY KEY (id_aluno)
);

CREATE TABLE professor 
(
    id_professor INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100) NOT NULL UNIQUE,
    departamento_id INT(10) UNSIGNED,
    PRIMARY KEY (id_professor),
    FOREIGN KEY (departamento_id) REFERENCES departamento(id_departamento)
);

CREATE TABLE curso
(
    id_curso INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    duracao INT UNSIGNED NOT NULL,
    departamento_id INT(10) UNSIGNED,
    coordenador VARCHAR(80) NOT NULL,
    PRIMARY KEY (id_curso),
    FOREIGN KEY (departamento_id) REFERENCES departamento(id_departamento)
    );

CREATE TABLE area
(
    id_area INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    departamento_id INT(10) UNSIGNED NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id_area),
    FOREIGN KEY (departamento_id) REFERENCES departamento(id_departamento)
);

CREATE TABLE cadeiras 
(
    id_cadeiras INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    cargaHoraria INT UNSIGNED NOT NULL,
    curso_id INT(10) UNSIGNED NOT NULL,
    professor_id INT(10) UNSIGNED,
    PRIMARY KEY (id_cadeiras),
    FOREIGN KEY (curso_id) REFERENCES curso(id_curso),
    FOREIGN KEY (professor_id) REFERENCES professor(id_professor)
); 

CREATE TABLE disciplina
(
    id_disciplina INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    professor_id INT(10) UNSIGNED NOT NULL,
    horario TIME NOT NULL,
    curso VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_disciplina),
    FOREIGN KEY (professor_id) REFERENCES professor(id_professor)
);

CREATE TABLE notas 
(
    id_notas INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    disciplina_id INT(10) UNSIGNED NOT NULL,
    aluno VARCHAR(80) NOT NULL,
    situacao VARCHAR(20) NOT NULL,
    nota FLOAT(10),
    PRIMARY KEY (id_notas),
    FOREIGN KEY (disciplina_id) REFERENCES disciplina(id_disciplina)
); 

CREATE TABLE turma
(
    id_turma INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    disciplina VARCHAR(100) NOT NULL,
    horario TIME NOT NULL,
    professor_id INT(10) UNSIGNED NOT NULL,
    aluno_id INT(10) UNSIGNED,
    PRIMARY KEY (id_turma),
    FOREIGN KEY (professor_id) REFERENCES professor(id_professor),
    FOREIGN KEY (aluno_id) REFERENCES aluno(id_aluno)
);

CREATE TABLE matricula
(
    id_matricula INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    aluno_id INT(10) UNSIGNED NOT NULL,
    curso_id INT(10) UNSIGNED NOT NULL,
    dataMatricula DATE NOT NULL,
    situacao VARCHAR(20),
    PRIMARY KEY (id_matricula),
    FOREIGN KEY (aluno_id) REFERENCES aluno(id_aluno),
    FOREIGN KEY (curso_id) REFERENCES curso(id_curso)
);

#ADICIONANDO VALORES AS TABELAS CRIADAS

INSERT INTO departamento (nome, diretor, email, localizacao) VALUES
('Ciências Exatas', 'Carlos Silva', 'carlos.silva@universidade.edu', 'Bloco A'),
('Humanidades', 'Ana Maria', 'ana.maria@universidade.edu', 'Bloco B'),
('Engenharias', 'Marcos Rocha', 'marcos.rocha@universidade.edu', 'Bloco C'),
('Artes', 'Juliana Costa', 'juliana.costa@universidade.edu', 'Bloco D'),
('Biologia', 'Fernando Souza', 'fernando.souza@universidade.edu', 'Bloco E'),
('Química', 'Sérgio Lima', 'sergio.lima@universidade.edu', 'Bloco F'),
('Física', 'Lucas Pereira', 'lucas.pereira@universidade.edu', 'Bloco G'),
('Computação', 'Paula Rodrigues', 'paula.rodrigues@universidade.edu', 'Bloco H'),
('Medicina', 'Bruno Martins', 'bruno.martins@universidade.edu', 'Bloco I'),
('Direito', 'Renata Carvalho', 'renata.carvalho@universidade.edu', 'Bloco J');

INSERT INTO curso (nome, duracao, departamento_id, coordenador) VALUES
('Matemática', 4, 1, 'João Pereira'),
('História', 4, 2, 'Maria Oliveira'),
('Engenharia Civil', 5, 3, 'Pedro Costa'),
('Artes Plásticas', 4, 4, 'Lucas Santos'),
('Biomedicina', 4, 5, 'Fernanda Almeida'),
('Química Industrial', 4, 6, 'Ricardo Silva'),
('Física Aplicada', 4, 7, 'Carla Mendes'),
('Ciência da Computação', 4, 8, 'Patrícia Ramos'),
('Medicina', 6, 9, 'Gustavo Fernandes'),
('Direito', 5, 10, 'Adriana Lopes');

INSERT INTO area (nome, descricao, departamento_id, email) VALUES
('Álgebra', 'Estudo das estruturas algébricas', 1, 'algebra@universidade.edu'),
('História Antiga', 'Estudo das civilizações antigas', 2, 'historia.antiga@universidade.edu'),
('Construção Civil', 'Estudo das técnicas de construção', 3, 'construcao.civil@universidade.edu'),
('Pintura', 'Estudo das técnicas de pintura', 4, 'pintura@universidade.edu'),
('Microbiologia', 'Estudo dos microorganismos', 5, 'microbiologia@universidade.edu'),
('Química Orgânica', 'Estudo das substâncias orgânicas', 6, 'quimica.organica@universidade.edu'),
('Física Teórica', 'Estudo das teorias físicas', 7, 'fisica.teorica@universidade.edu'),
('Inteligência Artificial', 'Estudo das técnicas de IA', 8, 'ia@universidade.edu'),
('Cardiologia', 'Estudo do sistema cardiovascular', 9, 'cardiologia@universidade.edu'),
('Direito Constitucional', 'Estudo das leis constitucionais', 10, 'direito.constitucional@universidade.edu');

INSERT INTO professor (nome, telefone, email, departamento_id) VALUES
('João Pereira', '123456789', 'joao.pereira@universidade.edu', 1),
('Maria Oliveira', '987654321', 'maria.oliveira@universidade.edu', 2),
('Pedro Costa', '555444333', 'pedro.costa@universidade.edu', 3),
('Lucas Santos', '222333444', 'lucas.santos@universidade.edu', 4),
('Fernanda Almeida', '999888777', 'fernanda.almeida@universidade.edu', 5),
('Ricardo Silva', '444555666', 'ricardo.silva@universidade.edu', 6),
('Carla Mendes', '111222333', 'carla.mendes@universidade.edu', 7),
('Patrícia Ramos', '888777666', 'patricia.ramos@universidade.edu', 8),
('Gustavo Fernandes', '777888999', 'gustavo.fernandes@universidade.edu', 9),
('Adriana Lopes', '333222111', 'adriana.lopes@universidade.edu', 10);

INSERT INTO cadeiras (nome, cargaHoraria, curso_id, professor_id) VALUES
('Cálculo I', 60, 1, 1),
('História Geral', 45, 2, 2),
('Estruturas', 75, 3, 3),
('Teoria das Cores', 30, 4, 4),
('Microbiologia Aplicada', 60, 5, 5),
('Química Orgânica Avançada', 70, 6, 6),
('Física Quântica', 80, 7, 7),
('Programação em Python', 40, 8, 8),
('Anatomia Humana', 90, 9, 9),
('Direito Civil', 50, 10, 10);

INSERT INTO disciplina (nome, professor_id, horario, curso) VALUES
('Cálculo I', 1, '08:00:00', 'Matemática'),
('História Geral', 2, '10:00:00', 'História'),
('Estruturas', 3, '14:00:00', 'Engenharia Civil'),
('Teoria das Cores', 4, '09:00:00', 'Artes Plásticas'),
('Microbiologia Aplicada', 5, '11:00:00', 'Biomedicina'),
('Química Orgânica Avançada', 6, '13:00:00', 'Química Industrial'),
('Física Quântica', 7, '15:00:00', 'Física Aplicada'),
('Programação em Python', 8, '16:00:00', 'Ciência da Computação'),
('Anatomia Humana', 9, '08:00:00', 'Medicina'),
('Direito Civil', 10, '10:00:00', 'Direito');

INSERT INTO notas (disciplina_id, aluno, situacao, nota) VALUES
(1, 'Lucas Souza', 'Aprovado', 8.5),
(2, 'Beatriz Lima', 'Aprovado', 7.0),
(3, 'Carlos Gomes', 'Reprovado', 4.0),
(4, 'Mariana Costa', 'Aprovado', 9.0),
(5, 'João Santos', 'Aprovado', 8.0),
(6, 'Patrícia Ferreira', 'Reprovado', 5.5),
(7, 'Ricardo Almeida', 'Aprovado', 7.8),
(8, 'Ana Rodrigues', 'Aprovado', 8.7),
(9, 'Felipe Martins', 'Aprovado', 7.9),
(10, 'Camila Lopes', 'Reprovado', 6.2);

INSERT INTO aluno (curso, nome, dataNasc) VALUES
('Matemática', 'Lucas Souza', '2000-01-15'),
('História', 'Beatriz Lima', '1999-05-20'),
('Engenharia Civil', 'Carlos Gomes', '1998-11-30'),
('Artes Plásticas', 'Mariana Costa', '2001-03-25'),
('Biomedicina', 'João Santos', '2000-07-10'),
('Química Industrial', 'Patrícia Ferreira', '1999-09-14'),
('Física Aplicada', 'Ricardo Almeida', '1998-12-01'),
('Ciência da Computação', 'Ana Rodrigues', '2001-06-18'),
('Medicina', 'Felipe Martins', '1999-02-22'),
('Direito', 'Camila Lopes', '2000-08-30');

INSERT INTO matricula (aluno_id, curso_id, dataMatricula, situacao) VALUES
(1, 1, '2023-02-01', 'Ativo'),
(2, 2, '2023-02-01', 'Ativo'),
(3, 3, '2023-02-01', 'Ativo'),
(4, 4, '2023-02-01', 'Ativo'),
(5, 5, '2023-02-01', 'Ativo'),
(6, 6, '2023-02-01', 'Ativo'),
(7, 7, '2023-02-01', 'Ativo'),
(8, 8, '2023-02-01', 'Ativo'),
(9, 9, '2023-02-01', 'Ativo'),
(10, 10, '2023-02-01', 'Ativo');

INSERT INTO turma (disciplina, horario, professor_id, aluno_id) VALUES
('Cálculo I', '08:00:00', 1, 1),
('História Geral', '10:00:00', 2, 2),
('Estruturas', '14:00:00', 3, 3),
('Teoria das Cores', '09:00:00', 4, 4),
('Microbiologia Aplicada', '11:00:00', 5, 5),
('Química Orgânica Avançada', '13:00:00', 6, 6),
('Física Quântica', '15:00:00', 7, 7),
('Programação em Python', '16:00:00', 8, 8),
('Anatomia Humana', '08:00:00', 9, 9),
('Direito Civil', '10:00:00', 10, 10);



