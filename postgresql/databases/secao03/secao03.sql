-- CREATE DATABASE secao03;

--===--

-- CREATE TABLE tipos_produtos(
	-- id SERIAL PRIMARY KEY,
	-- descricao CHARACTER VARYING(50) NOT NULL
-- );

---

-- CREATE TABLE produto(
	-- id SERIAL PRIMARY KEY,
	-- descricao CHARACTER VARYING(50) NOT NULL,
	-- preco MONEY NOT NULL,
	-- id_codigo_produto INT REFERENCES tipos_produtos(id) NOT NULL
-- );

---

-- CREATE TABLE cadastro_paciente(
	-- id SERIAL PRIMARY KEY,
	-- nome CHARACTER VARYING(50) NOT NULL,
	-- endereco CHARACTER VARYING(50) NOT NULL,
	-- bairro CHARACTER VARYING(50) NOT NULL,
	-- cidade VARCHAR(40) NOT NULL,
	-- estado CHAR(2) NOT NULL,
	-- cep VARCHAR(9) NOT NULL,
	-- data_nascimento DATE NOT NULL
-- );

---

-- CREATE TABLE professores(
	-- id SERIAL PRIMARY KEY,
	-- telefone INT NOT NULL,
	-- nome_professor VARCHAR (50)
-- );
--- 

-- CREATE TABLE turmas(
	-- id SERIAL PRIMARY KEY,
	-- capacidade INT NOT NULL,
	-- id_professor INT REFERENCES professores(id) NOT NULL
-- );

--===--

-- INSERTS 

-- tipos_produtos
-- INSERT INTO tipos_produtos (descricao) VALUES ('Computadores');
-- INSERT INTO tipos_produtos (descricao) VALUES ('Impressoras');
-- INSERT INTO tipos_produtos (descricao) VALUES ('Diversos');

-- produtos
-- INSERT INTO produto (descricao, preco, id_codigo_produto) VALUES ('Impressora Jato de Tinta', 456.78, 2);
-- INSERT INTO produto (descricao, preco, id_codigo_produto) VALUES ('Notebook DELL 1544', 2345.67, 1);
-- INSERT INTO produto (descricao, preco, id_codigo_produto) VALUES ('Mouse Sem Fio', 45, 3);

--pacientes 
-- INSERT INTO cadastro_paciente (nome, endereco, bairro, cidade, estado, cep, data_nascimento) 
	-- VALUES ('Maria', 'Rua A', 'A', 'Sao Paulo', 'SP', '000000000', '1998-09-12');
-- INSERT INTO cadastro_paciente (nome, endereco, bairro, cidade, estado, cep, data_nascimento) 
	-- VALUES ('Joao', 'Rua B', 'B', 'Belo Horizonte', 'BH', '111111111', '2003-10-11');

-- SELECTS
-- SELECT * FROM cadastro_paciente;