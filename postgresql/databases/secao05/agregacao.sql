CREATE TABLE categorias(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(60) NOT NULL,
	preco_venda MONEY NOT NULL,
	preco_custo MONEY NOT NULL,
	id_categorias INT REFERENCES categorias(id) NOT NULL
);


INSERT INTO categorias (nome)
VALUES
('Eletrônicos'),
('Informática'),
('Alimentos'),
('Bebidas'),
('Roupas'),
('Calçados'),
('Móveis'),
('Higiene'),
('Esportes'),
('Livros');

INSERT INTO produtos(descricao, preco_venda, preco_custo, id_categorias) 
VALUES
('Mouse Gamer', 149.90, 80.00, 2),
('Teclado Mecânico', 299.90, 170.00, 2),
('Monitor 24 Polegadas', 899.90, 600.00, 1),
('Fone Bluetooth', 199.90, 110.00, 1),
('Arroz 5kg', 29.90, 22.00, 3),
('Feijão 1kg', 8.99, 6.00, 3),
('Café 500g', 18.90, 12.00, 3),
('Refrigerante 2L', 9.90, 6.50, 4),
('Camiseta Básica', 49.90, 25.00, 5),
('Calça Jeans', 129.90, 75.00, 5),
('Tênis Esportivo', 199.90, 120.00, 6),
('Sandália', 79.90, 45.00, 6),
('Cadeira de Escritório', 599.90, 380.00, 7),
('Mesa de Escritório', 799.90, 500.00, 7),
('Shampoo', 24.90, 14.00, 8),
('Sabonete', 5.99, 3.00, 8),
('Bola de Futebol', 89.90, 50.00, 9),
('Halter 10kg', 129.90, 80.00, 9),
('Livro de Python', 99.90, 55.00, 10),
('Livro de PostgreSQL', 119.90, 70.00, 10);

-- MAX
SELECT MAX(preco_venda) FROM produtos;

-- MIN
SELECT MIN(preco_venda) FROM produtos;

-- AVG - ROUD --
SELECT ROUND(AVG(preco_custo::numeric), 2) FROM produtos;

-- COUNT
SELECT COUNT(preco_venda) AS quantidade FROM produtos WHERE id_categorias = 1;

-- GROUP BY
SELECT id_categorias, MAX(preco_venda) FROM produtos GROUP BY id_cartegorias;

-- HAVING
SELECT id_categorias, MAX(preco_venda) FROM produtos GROUP BY id_categorias HAVING MAX(preco_venda::numeric) > 100;

CREATE DATABASE agrupamento;;





	