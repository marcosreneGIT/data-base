CREATE TABLE tipos(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE fabricantes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL,
	quantidade INT NOT NULL,
	id_fabricante INT REFERENCES fabricantes (id) NOT NULL,
	id_tipos INT REFERENCES tipos(id) NOT NULL
);


INSERT INTO tipos (nome) VALUES
('Eletrônico'),
('Informática'),
('Eletrodoméstico'),
('Móvel'),
('Esporte'),
('Vestuário'),
('Alimento'),
('Bebida'),
('Higiene'),
('Livro');

INSERT INTO fabricantes (nome) VALUES
('Samsung'),
('LG'),
('Dell'),
('Apple'),
('Sony'),
('Nike'),
('Adidas'),
('Nestlé'),
('Coca-Cola'),
('Microsoft');

INSERT INTO produtos (nome, quantidade, id_fabricante, id_tipos) VALUES
('Monitor 24"', 15, 1, 2),
('Smart TV 55"', 8, 1, 1),
('Televisão 50"', 10, 2, 1),
('Notebook Inspiron', 12, 3, 2),
('iPhone 15', 10, 4, 1),
('PlayStation 5', 7, 5, 1),
('Tênis Air Max', 20, 6, 5),
('Camiseta Esportiva', 25, 7, 6),
('Chocolate', 50, 8, 7),
('Refrigerante 2L', 40, 9, 8),
('Windows 11', 18, 10, 2),
('Geladeira Frost Free', 6, 2, 3),
('Cadeira Gamer', 9, 3, 4),
('Bola de Futebol', 30, 7, 5),
('Livro de Python', 15, 10, 10);


-- GROUP BY
SELECT t.nome AS tipo, f.nome AS fabricante, SUM(p.quantidade) AS estoque
FROM tipos AS t, fabricantes AS f, produtos AS p
WHERE t.id = p.id_tipos AND f.id = p.id_fabricante
GROUP BY t.nome, f.nome;

-- HAVING
SELECT t.nome AS tipo, f.nome AS fabricante, SUM(p.quantidade) AS estoque
FROM tipos AS t, fabricantes AS f, produtos AS p
WHERE t.id = p.id_tipos AND f.id = p.id_fabricante 
GROUP BY t.nome, f.nome
HAVING SUM(p.quantidade) > 20;

-- ASC & DESC 
SELECT id, nome, id_tipos, id_fabricante, quantidade FROM produtos ORDER BY quantidade DESC LIMIT 3; -- | ASC