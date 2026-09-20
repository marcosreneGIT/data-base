CREATE TABLE "generos" (
  "id" SERIAL PRIMARY KEY,
  "nome" varchar(50) NOT NULL
);

CREATE TABLE "filmes" (
  "id" SERIAL PRIMARY KEY,
  "titulo" varchar(100) NOT NULL,
  "id_genero" INT NOT NULL REFERENCES generos(id)
);

CREATE TABLE "dvds" (
  "id" SERIAL PRIMARY KEY,
  "id_filmes" int NOT NULL,
  "quantidade_discos" int NOT NULL DEFAULT 1
);

CREATE TABLE "atores" (
  "id" SERIAL PRIMARY KEY,
  "nome_artistico" VARCHAR(100),
  "nome_real" varchar(100) NOT NULL
);

CREATE TABLE "filmes_atores" (
  "id_filme" int REFERENCES filmes(id) ON DELETE CASCADE,
  "id_ator" int REFERENCES atores(id) ON DELETE CASCADE,
  PRIMARY KEY (id_filme, id_ator)
);

CREATE TABLE "clientes" (
  "id" SERIAL PRIMARY KEY,
  "numero_associado" int NOT NULL,
  "nome" varchar(50) NOT NULL,
  "sobrenome" varchar(50) NOT NULL,
  "telefone" varchar(20) NOT NULL,
  "logradouro" varchar(100) NOT NULL,
  "numero" varchar(10) NOT NULL,
  "complemento" varchar(50),
  "bairro" varchar(50) NOT NULL,
  "cidade" varchar(50) NOT NULL
);

CREATE TABLE "aluguel" (
  "id" SERIAL PRIMARY KEY,
  "data_emprestimo" DATE NOT NULL DEFAULT CURRENT_DATE,
  "data_devolucao_prevista" DATE NOT NULL,
  "data_devolucao_real" DATE,
  "valor_a_pago" money NOT NULL,
  "valor_pago" money,
  "id_dvd" int NOT NULL REFERENCES dvds(id),
  "id_cliente" int NOT NULL REFERENCES clientes(id)
);

INSERT INTO generos (nome) VALUES
('Ação'),
('Aventura'),
('Comédia'),
('Drama'),
('Terror'),
('Ficção Científica'),
('Fantasia'),
('Romance');

INSERT INTO filmes (titulo, id_genero) VALUES
('Matrix', 14),
('O Senhor dos Anéis', 15),
('Jurassic Park', 10),
('O Exorcista', 13),
('Forrest Gump', 12),
('De Volta para o Futuro', 14),
('Todo Mundo em Pânico', 11),
('Gladiador', 9),
('Titanic', 16),
('Indiana Jones e a Última Cruzada', 10);


INSERT INTO dvds (id_filmes, quantidade_discos) VALUES
(67, 3), 
(68, 2), 
(69, 2), 
(70, 1), 
(71, 2), 
(72, 3), 
(73, 1), 
(74, 2), 
(75, 3), 
(76, 2); 

INSERT INTO atores (nome_artistico, nome_real) VALUES
('Keanu Reeves', 'Keanu Charles Reeves'),
('Laurence Fishburne', 'Laurence John Fishburne III'),
('Elijah Wood', 'Elijah Jordan Wood'),
('Ian McKellen', 'Ian Murray McKellen'),
('Sam Neill', 'Nigel John Dermot Neill'),
('Laura Dern', 'Laura Elizabeth Dern'),
('Linda Blair', 'Linda Denise Blair'),
('Ellen Burstyn', 'Edna Rae Gillooly'),
('Tom Hanks', 'Thomas Jeffrey Hanks'),
('Michael J. Fox', 'Michael Andrew Fox'),
('Christopher Lloyd', 'Christopher Allen Lloyd'),
('Anna Faris', 'Anna Kay Faris'),
('Russell Crowe', 'Russell Ira Crowe'),
('Leonardo DiCaprio', 'Leonardo Wilhelm DiCaprio'),
('Kate Winslet', 'Kate Elizabeth Winslet'),
('Harrison Ford', 'Harrison Ford');


UPDATE filmes_atores SET
id_filme = 68 WHERE
id_filme = 67; 

SELECT * FROM filmes_atores;
SELECT * FROM filmes;


-- Matrix
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(68, 11),
(68, 12);

-- O Senhor dos Anéis
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(67, 13),
(67, 14);

-- Jurassic Park
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(68, 15),
(68, 16);

-- O Exorcista
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(69, 17),
(69, 18);

-- Forrest Gump
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(70, 19);

-- De Volta para o Futuro
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(71, 20),
(72, 21);

-- Todo Mundo em Pânico
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(73, 22);

-- Gladiador
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(74, 23);

-- Titanic
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(75, 24),
(75, 25);

-- Indiana Jones
INSERT INTO filmes_atores (id_filme, id_ator) VALUES
(76, 26);

INSERT INTO clientes (
    numero_associado,
    nome,
    sobrenome,
    telefone,
    logradouro,
    numero,
    complemento,
    bairro,
    cidade
) VALUES
(1001, 'Marcos', 'Silva', '71999990001', 'Rua das Flores', '100', NULL, 'Centro', 'Salvador'),
(1002, 'João', 'Santos', '71999990002', 'Avenida Brasil', '250', 'Apto 301', 'Pituba', 'Salvador'),
(1003, 'Ana', 'Oliveira', '71999990003', 'Rua Bahia', '45', NULL, 'Centro', 'Feira de Santana'),
(1004, 'Carlos', 'Souza', '71999990004', 'Rua das Palmeiras', '78', 'Casa', 'Centro', 'Ipirá'),
(1005, 'Juliana', 'Costa', '71999990005', 'Avenida Central', '500', 'Apto 202', 'Brotas', 'Salvador'),
(1006, 'Pedro', 'Almeida', '71999990006', 'Rua Principal', '32', NULL, 'Centro', 'Serrinha'),
(1007, 'Fernanda', 'Lima', '71999990007', 'Rua da Paz', '90', 'Casa 2', 'Centro', 'Alagoinhas'),
(1008, 'Ricardo', 'Rocha', '71999990008', 'Avenida Vitória', '120', NULL, 'Centro', 'Salvador');


INSERT INTO aluguel (
    data_emprestimo,
    data_devolucao_prevista,
    data_devolucao_real,
    valor_a_pago,
    valor_pago,
    id_dvd,
    id_cliente
) VALUES
('2026-09-01', '2026-09-05', '2026-09-04', 10.00, 10.00, 41, 6),
('2026-09-02', '2026-09-06', '2026-09-06', 8.00, 8.00, 43, 7),
('2026-09-03', '2026-09-07', NULL, 12.00, NULL, 42, 8),
('2026-09-04', '2026-09-08', '2026-09-08', 7.00, 7.00, 44, 9),
('2026-09-05', '2026-09-09', '2026-09-08', 10.00, 10.00, 45, 10),
('2026-09-06', '2026-09-10', NULL, 15.00, NULL, 46, 11),
('2026-09-07', '2026-09-11', '2026-09-10', 8.00, 8.00, 47, 12),
('2026-09-08', '2026-09-12', '2026-09-12', 12.00, 12.00, 48, 13),
('2026-09-09', '2026-09-13', NULL, 15.00, NULL, 49, 13);

SELECT
    filmes.id AS id_filme,
    filmes.titulo AS filme,
    atores.id AS id_ator,
    atores.nome_artistico AS ator
FROM filmes
INNER JOIN filmes_atores
    ON filmes.id = filmes_atores.id_filme
INNER JOIN atores
    ON atores.id = filmes_atores.id_ator
ORDER BY filmes.titulo, atores.nome_artistico;


SELECT
    clientes.id AS id_cliente,
    clientes.numero_associado,
    clientes.nome AS nome_cliente,
    clientes.sobrenome,
    clientes.telefone,
    aluguel.id AS id_aluguel,
    aluguel.data_emprestimo,
    aluguel.data_devolucao_prevista,
    aluguel.data_devolucao_real,
    aluguel.valor_a_pago,
    aluguel.valor_pago,
    dvds.id AS id_dvd,
    dvds.quantidade_discos,
    filmes.id AS id_filme,
    filmes.titulo AS filme,
    generos.nome AS genero,
    atores.id AS id_ator,
    atores.nome_artistico AS ator,
    atores.nome_real
FROM clientes
INNER JOIN aluguel
    ON clientes.id = aluguel.id_cliente
INNER JOIN dvds
    ON dvds.id = aluguel.id_dvd
INNER JOIN filmes
    ON filmes.id = dvds.id_filmes
INNER JOIN generos
    ON generos.id = filmes.id_genero
INNER JOIN filmes_atores
    ON filmes.id = filmes_atores.id_filme
INNER JOIN atores
    ON atores.id = filmes_atores.id_ator
ORDER BY clientes.nome, filmes.titulo;
