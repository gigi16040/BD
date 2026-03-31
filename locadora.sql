DROP DATABASE IF EXISTS Locadora;

CREATE DATABASE Locadora;

USE Locadora;


CREATE TABLE Clientes (
    ID_cliente INT AUTO_INCREMENT,
    CPF VARCHAR(11) NOT NULL,
    Nome VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(255),
    Status VARCHAR(50),
    PRIMARY KEY (ID_cliente)
);


CREATE TABLE Veiculos (
    ID_veiculo INT AUTO_INCREMENT,
    Modelo VARCHAR(255),
    Categoria VARCHAR(100),
    Placa VARCHAR(10),
    Status VARCHAR(50),
    Quilometragem INT,
    PRIMARY KEY (ID_veiculo)
);


CREATE TABLE Manutencao (
    ID_manutencao INT AUTO_INCREMENT,
    ID_veiculo INT,
    Tipo VARCHAR(50),
    Data_inicio DATETIME,
    Data_fim DATETIME,
    Descricao VARCHAR(255),
    PRIMARY KEY (ID_manutencao),
    FOREIGN KEY (ID_veiculo) REFERENCES Veiculos(ID_veiculo)
);


CREATE TABLE Contrato (
    ID_contrato INT AUTO_INCREMENT,
    ID_cliente INT,
    ID_veiculo INT,
    Data_retirada DATETIME,
    Data_prevista DATETIME,
    Valor_diaria DECIMAL(8,2),
    Seguro VARCHAR(100),
    PRIMARY KEY (ID_contrato),
    FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),
    FOREIGN KEY (ID_veiculo) REFERENCES Veiculos(ID_veiculo)
);


CREATE TABLE Devolucao (
    ID_devolucao INT AUTO_INCREMENT,
    ID_contrato INT,
    Data_devolucao DATETIME,
    Quilometragem_final INT,
    Danos VARCHAR(255),
    Combustivel_faltante VARCHAR(50),
    Valor_extra DECIMAL(8,2),
    PRIMARY KEY (ID_devolucao),
    FOREIGN KEY (ID_contrato) REFERENCES Contrato(ID_contrato)
);


CREATE TABLE Reservas (
    ID_reserva INT AUTO_INCREMENT,
    ID_cliente INT,
    ID_veiculo INT,
    Data_reserva DATETIME,
    Status VARCHAR(50),
    PRIMARY KEY (ID_reserva),
    FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),
    FOREIGN KEY (ID_veiculo) REFERENCES Veiculos(ID_veiculo)
);


CREATE TABLE Multas (
    ID_multa INT AUTO_INCREMENT,
    ID_contrato INT,
    Data_multa DATETIME,
    Valor DECIMAL(8,2),
    Descricao VARCHAR(255),
    PRIMARY KEY (ID_multa),
    FOREIGN KEY (ID_contrato) REFERENCES Contrato(ID_contrato)
);


INSERT INTO Clientes (CPF, Nome, Telefone, Email, Status) VALUES
('11111111111','Ana Silva','11999990001','ana@email.com','ativo'),
('22222222222','Bruno Costa','11999990002','bruno@email.com','ativo'),
('33333333333','Carlos Lima','11999990003','carlos@email.com','inadimplente'),
('44444444444','Daniela Souza','11999990004','daniela@email.com','ativo'),
('55555555555','Eduardo Rocha','11999990005','edu@email.com','ativo'),
('66666666666','Fernanda Alves','11999990006','fernanda@email.com','ativo'),
('77777777777','Gabriel Mendes','11999990007','gabriel@email.com','ativo'),
('88888888888','Helena Ribeiro','11999990008','helena@email.com','ativo'),
('99999999999','Igor Martins','11999990009','igor@email.com','inadimplente'),
('00000000000','Juliana Gomes','11999990010','juliana@email.com','ativo');

INSERT INTO Veiculos (Modelo, Categoria, Placa, Status, Quilometragem) VALUES
('Onix','Popular','ABC1234','disponivel',20000),
('HB20','Popular','DEF5678','alugado',30000),
('Corolla','Sedan','GHI9012','disponivel',40000),
('Civic','Sedan','JKL3456','manutencao',35000),
('Compass','SUV','MNO7890','reservado',25000),
('Renegade','SUV','PQR1234','disponivel',22000),
('Hilux','Utilitario','STU5678','disponivel',50000),
('Kombi','Van','VWX9012','alugado',60000),
('Spin','Van','YZA3456','disponivel',27000),
('Tracker','SUV','BCD7890','disponivel',15000);


INSERT INTO Reservas (ID_cliente, ID_veiculo, Data_reserva, Status) VALUES
(1,1,'2024-01-01 10:00:00','ativa'),
(2,5,'2024-01-02 11:00:00','ativa'),
(3,2,'2024-01-03 12:00:00','cancelada'),
(4,3,'2024-01-04 13:00:00','ativa'),
(5,6,'2024-01-05 14:00:00','ativa');


INSERT INTO Contrato (ID_cliente, ID_veiculo, Data_retirada, Data_prevista, Valor_diaria, Seguro) VALUES
(1,1,'2024-02-01 10:00:00','2024-02-05 10:00:00',100.00,'Basico'),
(2,2,'2024-02-02 11:00:00','2024-02-06 11:00:00',120.00,'Completo'),
(4,3,'2024-02-03 12:00:00','2024-02-07 12:00:00',150.00,'Basico'),
(5,6,'2024-02-04 13:00:00','2024-02-08 13:00:00',130.00,'Completo'),
(6,7,'2024-02-05 14:00:00','2024-02-09 14:00:00',200.00,'Completo');


INSERT INTO Devolucao (ID_contrato, Data_devolucao, Quilometragem_final, Danos, Combustivel_faltante, Valor_extra) VALUES
(1,'2024-02-05 10:00:00',20500,'Nenhum','Não',0),
(2,'2024-02-06 11:00:00',30500,'Arranhão leve','Sim',50),
(3,'2024-02-07 12:00:00',41000,'Nenhum','Não',0);


INSERT INTO Manutencao (ID_veiculo, Tipo, Data_inicio, Data_fim, Descricao) VALUES
(4,'corretiva','2024-01-10 08:00:00','2024-01-12 18:00:00','Problema no motor'),
(2,'preventiva','2024-01-15 08:00:00','2024-01-15 18:00:00','Revisão geral'),
(7,'preventiva','2024-01-20 08:00:00','2024-01-20 18:00:00','Troca de óleo');


INSERT INTO Multas (ID_contrato, Data_multa, Valor, Descricao) VALUES
(1,'2024-02-03',150.00,'Excesso de velocidade'),
(2,'2024-02-04',200.00,'Avanço de sinal'),
(3,'2024-02-05',100.00,'Estacionamento irregular');



SELECT * FROM Clientes;
SELECT * FROM Veiculos;
SELECT * FROM Reservas;
SELECT * FROM Contrato;
SELECT * FROM Devolucao;
SELECT * FROM Manutencao;
SELECT * FROM Multas;