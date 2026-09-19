CREATE TABLE profissoes(
	id SERIAL PRIMARY KEY,
	cargo VARCHAR(60) NOT NULL
);

CREATE TABLE clientes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	data_nascimento DATE NOT NULL,
	telefone VARCHAR(10) NOT NULL,
	id_profissoes INT REFERENCES profissoes(id) NOT NULL
);

CREATE TABLE consumidores(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	contato VARCHAR(50) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	cep VARCHAR(20) NOT NULL,
	pais VARCHAR(50) NOT NULL
);

INSERT INTO profissoes(cargo) VALUES
('Desenvolvedor de Software'),
('Professor'),
('Médico'),
('Engenheiro'),
('Administrador'),
('Designer'),
('Contador'),
('Advogado'),
('Eletricista'),
('Técnico de Informática');

INSERT INTO clientes(nome, data_nascimento, telefone, id_profissoes) VALUES 
('Carlos Silva', '1995-03-12', '7198765432', 1),
('Mariana Santos', '1990-07-25', '7198123456', 2),
('João Oliveira', '1988-11-04', '7199234567', 3),
('Fernanda Costa', '1993-01-18', '7198345678', 4),
('Rafael Souza', '1997-09-30', '7199456789', 5),
('Camila Almeida', '1992-05-14', '7198567890', 6),
('Bruno Pereira', '1985-12-22', '7199678901', 7),
('Juliana Rocha', '1998-06-08', '7198789012', 8),
('Diego Martins', '1991-10-17', '7199890123', 9),
('Larissa Gomes', '1996-02-27', '7198901234', 10);


INSERT INTO consumidores(nome, contato, endereco, cidade, cep, pais) VALUES
('Ana Souza', 'ana@gmail.com', 'Rua das Flores, 120', 'São Paulo', '01001-000', 'Brasil'),
('Pedro Lima', 'pedro@email.com', 'Av. Central, 450', 'Rio de Janeiro', '20010-000', 'Brasil'),
('Lucas Mendes', '11987654321', 'Rua Bahia, 85', 'Belo Horizonte', '30100-000', 'Brasil'),
('Beatriz Costa', 'beatriz@email.com', 'Rua do Comércio, 300', 'Salvador', '40010-000', 'Brasil'),
('Gabriel Santos', 'gabriel@email.com', 'Av. Brasil, 750', 'Curitiba', '80010-000', 'Brasil'),
('Patrícia Oliveira', '21981234567', 'Rua das Palmeiras, 90', 'Niterói', '24010-000', 'Brasil'),
('André Martins', 'andre@email.com', 'Rua São José, 210', 'Recife', '50010-000', 'Brasil'),
('Renata Almeida', 'renata@email.com', 'Av. Independência, 600', 'Porto Alegre', '90010-000', 'Brasil'),
('Felipe Rocha', 'felipe@email.com', 'Rua Goiás, 155', 'Goiânia', '74010-000', 'Brasil'),
('Amanda Pereira', 'amanda@email.com', 'Rua Central, 80', 'Fortaleza', '60010-000', 'Brasil');

-- JUNÇÃO DE PRODUTOS CARTESIANOS
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c, profissoes AS p 
WHERE c.id_profissoes = p.id;

-- INNER JOIN 
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c INNER JOIN profissoes AS p
ON c.id_profissoes = p.id;

-- LEFT OUTER JOIN
SELECT * FROM clientes
LEFT OUTER JOIN profissoes 
ON clientes.id_profissoes = profissoes.id;

-- RIGHT OUTER JOIN
SELECT * FROM clientes 
RIGHT OUTER JOIN profissoes 
ON clientes.id_profissoes = profissoes.id;

-- FULL OUTER JOIN
SELECT * FROM clientes 
FULL OUTER JOIN profissoes 
ON clientes.id_profissoes = profissoes.id;

-- CROSS JOIN 
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo 
FROM clientes AS c CROSS JOIN profissoes AS p;

-- SELF JOIN 
SELECT a.nome AS consumidor_01, b.nome AS consumidor_02, a.cidade
FROM consumidores AS a INNER JOIN consumidores AS b
ON a.id <> b.id AND a.cidade = b.cidade 
ORDER BY a.cidade;

CREATE DATABASE agregacao;
	