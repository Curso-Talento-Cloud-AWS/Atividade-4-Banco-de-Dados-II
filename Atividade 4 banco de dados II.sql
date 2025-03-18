-- Cria o banco de dados
CREATE DATABASE IF NOT EXISTS LojaDB;
USE LojaDB;

-- Tabela de Produtos
CREATE TABLE produtos (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Produto VARCHAR(255) NOT NULL,
    Quantidade_Produto_Estoque INT NOT NULL,
    Quantidade_Produto_Vendido INT NOT NULL
);

-- Tabela de Clientes
CREATE TABLE clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Cliente VARCHAR(255) NOT NULL,
    Data_Registro DATE NOT NULL
);

-- Inserindo dados na tabela produtos
INSERT INTO produtos (Nome_Produto, Quantidade_Produto_Estoque, Quantidade_Produto_Vendido) VALUES
('Arroz', 100, 50),
('Feijão', 200, 150),
('Macarrão', 150, 80),
('Óleo', 50, 20),
('Açúcar', 120, 60),
('Sal', 80, 40),
('Farinha', 90, 30),
('Café', 110, 55),
('Leite', 130, 65),
('Manteiga', 70, 35),
('Biscoito', 140, 70),
('Chocolate', 60, 30),
('Refrigerante', 180, 90),
('Suco', 100, 50),
('Água', 250, 125),
('Sabonete', 200, 100),
('Detergente', 160, 80),
('Shampoo', 120, 60),
('Papel Higiênico', 300, 150),
('Sabão em Pó', 80, 40);

-- Inserindo dados na tabela clientes
INSERT INTO clientes (Nome_Cliente, Data_Registro) VALUES
('João Silva', '2023-03-20'),
('Maria Oliveira', '2023-03-20'),
('Carlos Souza', '2023-03-20'),
('Ana Pereira', '2023-03-21'),
('Fernanda Lima', '2023-03-21'),
('Ricardo Almeida', '2023-03-21'),
('Bruna Santos', '2023-03-22'),
('Eduardo Costa', '2023-03-22'),
('Patrícia Gomes', '2023-03-22'),
('Luiz Rodrigues', '2023-03-23'),
('Mariana Ribeiro', '2023-03-23'),
('Pedro Martins', '2023-03-23'),
('Aline Carvalho', '2023-03-24'),
('Roberto Dias', '2023-03-24'),
('Beatriz Silva', '2023-03-24'),
('Gustavo Moreira', '2023-03-25'),
('Carla Barbosa', '2023-03-25'),
('Diego Fernandes', '2023-03-25'),
('Sofia Lima', '2023-03-26'),
('Bruno Lima', '2023-03-26');

-- Função para somar todos os clientes que foram cadastrados na loja durante um dia
DELIMITER //
CREATE FUNCTION total_clientes_por_dia(data_especifica DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM clientes
    WHERE Data_Registro = data_especifica;
    
    RETURN total;
END //
DELIMITER ;

SELECT total_clientes_por_dia('2023-03-20') AS ClientesNoDia;