INSERT INTO empresas (nome, funcionarios, cidade) VALUES
('TechSolutions', 25, 'São Paulo'),
('Inovação Digital', 8, 'Rio de Janeiro'),
('Logística Express', 120, 'Curitiba'),
('Mercado Central', 15, 'Belo Horizonte'),
('Alfa Engenharia', 50, 'Porto Alegre'),
('Padaria Pão Quente', 5, 'Salvador'),
('Consultoria Financeira', 12, 'Brasília'),
('Livraria Saber', 4, 'Recife'),
('Oficina Mecânica Precision', 9, 'Campinas'),
('Indústria Metalúrgica', 300, 'Joinville');

SELECT * FROM empresas;

UPDATE empresas SET funcionarios = 1500 WHERE id = 3;
DELETE FROM empresas WHERE id = 2;
