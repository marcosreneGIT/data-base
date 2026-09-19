-- CREATE DATABASE secao04;

-- NAO FUNCIONA NO POSTGRESQL: 
	-- USE secao04;

--===--

 -- CREATE TABLE tipos_produtos(
	 -- id SERIAL PRIMARY KEY,
	 -- descricao CHARACTER VARYING(50) NOT NULL
 -- ); 

---

-- CREATE TABLE produtos(
	  -- id SERIAL PRIMARY KEY,
	  -- descricao CHARACTER VARYING(50) NOT NULL,
	  -- preco MONEY NOT NULL,
	  -- id_codigo_produtos INT REFERENCES tipos_produtos(id) NOT NULL
 -- );

---

-- INSERT INTO tipos_produtos (descricao) VALUES
-- ('Eletrônicos'),
-- ('Alimentos'),
-- ('Bebidas'),
-- ('Vestuário'),
-- ('Móveis'),
-- ('Produtos de Limpeza'),
-- ('Higiene Pessoal'),
-- ('Informática'),
-- ('Eletrodomésticos'),
-- ('Papelaria');

-- INSERT INTO produtos (descricao, preco, id_codigo_produtos) VALUES
-- ('Smartphone Galaxy', 1500.00, 1),
-- ('Notebook Dell', 3500.00, 8),
-- ('Arroz 5kg', 25.50, 2),
-- ('Refrigerante 2L', 8.00, 3),
-- ('Camiseta Algodão', 49.90, 4),
-- ('Cadeira de Escritório', 450.00, 5),
-- ('Detergente 500ml', 3.20, 6),
-- ('Sabonete', 2.50, 7),
-- ('Geladeira Frost Free', 2800.00, 9),
-- ('Caderno 10 Matérias', 18.90, 10); 

--===--

-- SELECTS - DQL --

-- SELECT * FROM produtos ORDER BY id;
-- SELECT id, descricao, id_codigo_produtos FROM produtos;

-- SELECT * FROM tipos_produtos ORDER BY id;
-- SELECT id, descricao FROM tipos_produtos;

-- SELECT p.id AS cod, p.descricao AS descr, p.preco AS pre, p.id_codigo_produtos AS cp FROM produtos AS p;

--===--

-- UPDATE - DML --

-- UPDATE tipos_produtos SET descricao = 'Notebook' WHERE id = 10;

-- UPDATE produtos SET descricao = 'Notebook ACE', preco = 2800 WHERE id = 2;

-- CUIDADO COM A FALTA DO WHERE:
-- UPDATE produtos set descricao = 'Notebook', preco = '2800';

--===--

-- DELETE - DML --

-- DELETE FROM produtos WHERE id_codigo_produtos = 7;
-- DELETE FROM tipos_produtos WHERE id = 7;

--===--

-- ALTER - DDL --

-- ALTER TABLE tipos_produtos ADD peso DECIMAL(8, 2); -- 12345678.01

-- DROP - DDL --

-- DROP TABLE tipos_produtos;
-- ALTER TABLE tipos_produtos DROP COLUMN peso;
-- DROP USER estagiario;

--===--

-- CREATE USER estagiario WITH PASSWORD '123456'; 
-- CREATE TABLE empresas(
	-- id SERIAL PRIMARY KEY,
	-- nome VARCHAR(50) NOT NULL,
	-- funcionarios INT NOT NULL,
	-- cidade VARCHAR(50) NOT NULL
--);

-- GRANT - DCL --

-- GRANT ALL ON empresas TO estagiario;
-- GRANT USAGE, SELECT ON SEQUENCE empresas_id_seq TO estagiario; 
-- GRANT SELECT ON empresas TO estagiario;

-- REVOKE - DCL --

-- REVOKE ALL ON empresas FROM estagiario;
-- REVOKE USAGE, SELECT ON SEQUENCE empresas_id_seq FROM estagiario;

--===--

-- BEGIN - DTL --

-- BEGIN TRANSACTION;

-- INSERT INTO tipos_produtos (descricao) VALUES ('Equipamentos');

-- ROBACK - DTL --

-- ROLLBACK;

-- COMMIT - DTL --

-- COMMIT;
