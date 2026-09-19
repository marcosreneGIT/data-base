CREATE TABLE tipos_produtos(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL,
	preco MONEY NOT NULL,
	id_tipos_produtos INT REFERENCES tipos_produtos(id) NOT NULL
);

INSERT INTO tipos_produtos (descricao) VALUES
('Eletrônicos'),
('Alimentos'),
('Roupas'),
('Móveis'),
('Livros'),
('Higiene'),
('Esportes');

INSERT INTO produtos (descricao, preco, id_tipos_produtos)
('Teclado Mecânico', 250.00, 1),
('Mouse Gamer', 150.00, 1),
('Monitor 24 polegadas', 899.90, 1),
('Arroz 5kg', 28.50, 2),
('Feijão 1kg', 8.99, 2),
('Macarrão 500g', 5.50, 2),
('Camiseta Básica', 49.90, 3),
('Calça Jeans', 129.90, 3),
('Tênis Esportivo', 199.90, 3),
('Mesa de Escritório', 450.00, 4),
('Cadeira Gamer', 850.00, 4),
('Estante', 320.00, 4),
('Livro de Python', 89.90, 5),
('Livro de PostgreSQL', 99.90, 5),
('Shampoo', 18.50, 6),
('Sabonete', 4.50, 6),
('Bola de Futebol', 79.90, 7),
('Halter 10kg', 120.00, 7);

SELECT * FROM produtos WHERE id_tipos_produtos = 1;
SELECT * FROM produtos WHERE preco <= 'R$100';

SELECT p.id AS codigo, p.descricao AS nome, p.preco, tp.descricao FROM
produtos AS P, tipos_produtos AS tp WHERE p.id_tipos_produtos = tp.id;

CREATE DATABASE juncao;






