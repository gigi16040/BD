DROP DATABASE IF EXISTS ClinicaVet;

CREATE DATABASE ClinicaVet;

USE ClinicaVet;


CREATE TABLE Clientes (
ID_cliente INT AUTO_INCREMENT,
Nome VARCHAR(255),
CPF VARCHAR(11),
Telefone VARCHAR(15),
Email VARCHAR(255),
Endereco VARCHAR(255),
PRIMARY KEY(ID_cliente)
);


CREATE TABLE Pets (
ID_pet INT AUTO_INCREMENT,
Nome VARCHAR(255),
Especie VARCHAR(100),
Raca VARCHAR(100),
Idade INT,
Peso DECIMAL(5,2),
ID_cliente INT,
PRIMARY KEY(ID_pet),
FOREIGN KEY(ID_cliente) REFERENCES Clientes(ID_cliente)
);


CREATE TABLE Veterinarios (
ID_vet INT AUTO_INCREMENT,
Nome VARCHAR(255),
CRMV VARCHAR(20),
Especialidade VARCHAR(100),
Telefone VARCHAR(15),
PRIMARY KEY(ID_vet)
);


CREATE TABLE Consultas (
ID_consulta INT AUTO_INCREMENT,
Data_consulta DATETIME,
Motivo VARCHAR(255),
Valor DECIMAL(8,2),
ID_pet INT,
ID_vet INT,
PRIMARY KEY(ID_consulta),
FOREIGN KEY(ID_pet) REFERENCES Pets(ID_pet),
FOREIGN KEY(ID_vet) REFERENCES Veterinarios(ID_vet)
);


CREATE TABLE Vacinas (
ID_vacina INT AUTO_INCREMENT,
Nome VARCHAR(255),
Data_aplicacao DATE,
Proxima_dose DATE,
ID_pet INT,
PRIMARY KEY(ID_vacina),
FOREIGN KEY(ID_pet) REFERENCES Pets(ID_pet)
);


CREATE TABLE Exames (
ID_exame INT AUTO_INCREMENT,
Tipo VARCHAR(255),
Resultado VARCHAR(255),
Data_exame DATE,
ID_pet INT,
PRIMARY KEY(ID_exame),
FOREIGN KEY(ID_pet) REFERENCES Pets(ID_pet)
);


CREATE TABLE Pagamentos (
ID_pagamento INT AUTO_INCREMENT,
Valor DECIMAL(8,2),
Forma_pagamento VARCHAR(100),
Data_pagamento DATE,
ID_consulta INT,
PRIMARY KEY(ID_pagamento),
FOREIGN KEY(ID_consulta) REFERENCES Consultas(ID_consulta)
);


INSERT INTO Clientes (Nome,CPF,Telefone,Email,Endereco) VALUES
('Ana Souza','11111111111','11999990001','ana@email.com','Rua A'),
('Bruno Lima','22222222222','11999990002','bruno@email.com','Rua B'),
('Carla Mendes','33333333333','11999990003','carla@email.com','Rua C');


INSERT INTO Pets (Nome,Especie,Raca,Idade,Peso,ID_cliente) VALUES
('Thor','Cachorro','Labrador',5,28.5,1),
('Mimi','Gato','Persa',3,4.2,2),
('Rex','Cachorro','Poodle',7,10.0,3);


INSERT INTO Veterinarios (Nome,CRMV,Especialidade,Telefone) VALUES
('Dra Camila','12345','Clínico Geral','11988880001'),
('Dr Pedro','54321','Cirurgião','11988880002');


INSERT INTO Consultas (Data_consulta,Motivo,Valor,ID_pet,ID_vet) VALUES
('2024-01-10 10:00:00','Febre',150.00,1,1),
('2024-01-11 14:00:00','Vacinação',120.00,2,1),
('2024-01-12 09:00:00','Dor na pata',180.00,3,2);


INSERT INTO Vacinas (Nome,Data_aplicacao,Proxima_dose,ID_pet) VALUES
('Antirrábica','2024-01-11','2025-01-11',2),
('V10','2024-01-12','2025-01-12',1);


INSERT INTO Exames (Tipo,Resultado,Data_exame,ID_pet) VALUES
('Sangue','Normal','2024-01-10',1),
('Raio-X','Fratura leve','2024-01-12',3);


INSERT INTO Pagamentos (Valor,Forma_pagamento,Data_pagamento,ID_consulta) VALUES
(150.00,'Pix','2024-01-10',1),
(120.00,'Cartão','2024-01-11',2),
(180.00,'Dinheiro','2024-01-12',3);

SELECT * FROM Clientes;
SELECT * FROM Pets;
SELECT * FROM Veterinarios;
SELECT * FROM Consultas;
SELECT * FROM Vacinas;
SELECT * FROM Exames;
SELECT * FROM Pagamentos;