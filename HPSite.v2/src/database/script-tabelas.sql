CREATE USER 'techberry_client'@'localhost' IDENTIFIED BY 'sptech';
GRANT SELECT, UPDATE, INSERT, DELETE, EXECUTE, SHOW VIEW ON TechBerry.* TO 'techberry_client'@'localhost';

CREATE DATABASE TechBerry;
USE TechBerry;

CREATE TABLE cliente(
    idCliente INT PRIMARY KEY IDENTITY(1,1),
    nomeCliente VARCHAR(45) NOT NULL,
    CNPJ CHAR(18) NOT NULL UNIQUE,
    telefoneCliente CHAR(15) NOT NULL UNIQUE,
    emailCliente CHAR(45) NOT NULL UNIQUE,
    senha VARCHAR(45) NOT NULL
);

CREATE TABLE estufa(
    idEstufa INT PRIMARY KEY IDENTITY(5000,1),
    apelidoEstufa VARCHAR(45) NOT NULL,
    enderecoEstufa VARCHAR(96) NOT NULL,
    idCliente INT NOT NULL,
    FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE sensor(
    idSensor INT PRIMARY KEY IDENTITY(2000,1),
    modelo VARCHAR(45) NOT NULL,
    serialNumber VARCHAR(45) NOT NULL,
    idEstufa INT NOT NULL,
    FOREIGN KEY(idEstufa) REFERENCES estufa(idEstufa)
);

CREATE TABLE medida(
    idMedida INT PRIMARY KEY IDENTITY(10000,1),
    temperaturaRegistrada FLOAT NOT NULL,
    umidadeRegistrada FLOAT CHECK(umidadeRegistrada < 101 AND umidadeRegistrada > -1) NOT NULL,
    horarioRegistro DATETIME NOT NULL,
    idSensor INT NOT NULL,
    FOREIGN KEY(idSensor) REFERENCES sensor(idSensor)
);

INSERT INTO cliente VALUES
(NULL, 'Amaral da Silva Amado', '32.501.780/0001-40', '(11) 97895-2145', 'amaral@sptech.school', '12345678'),
(NULL, 'Bernado Lima Ameixado', '36.108.006/0001-24', '(11) 98757-8574', 'bernardo@sptech.school', '12345678'),
(NULL, 'Anderson Vasques Dias', '95.546.822/0001-89', '(11) 98962-7413', 'anderson@sptech.school', '12345678'),
(NULL, 'Cauan Alvares Migueli', '65.096.888/0001-53', '(11) 97854-1115', 'cauan@sptech.school', '12345678'),
(NULL, 'Davi dos Santos Faria', '67.500.410/0001-72', '(11) 93821-2322', 'davi@sptech.school', '12345678'),
(NULL, 'Osmar Loss dos Santos', '84.222.772/0001-68', '(11) 99875-7858', 'osmar@sptech.school', '12345678');

INSERT INTO estufa VALUES
(NULL, 'Fazenda do Seu Amaral', 'Rua Alvares Canastra, 78 - Jd. Campo Belo, Campinas - SP', 1),
(NULL, 'Plantação do Bernardo', 'Rua dos Alfeneiros, 4 - Jd. das Flores, Osasco - SP', 2),
(NULL, 'Vinícola Góes', 'Av. Franco Américo, 654 - Vila Rosa Maya, São José dos Campos - SP', 3),
(NULL, 'Estufa de Testes da Família Migueli', 'Estrada do Campo Limpo, 874, Vinhedo - SP', 4),
(NULL, 'Estufa do Seu Davi', 'Av. Pacaembu, 784 - Pacaembu, São Paulo - SP', 5),
(NULL, 'Sítio dos Loss', 'Rua Mario Certezas, 544 - Vila dos Andradines, Ribeirão Preto-SP', 6);

INSERT INTO sensor VALUES
(NULL, 'DHT11', '28839352310', 5000),
(NULL, 'DHT11', '99839809718', 5000),
(NULL, 'DHT11', '70439257760', 5000),
(NULL, 'DHT11', '20657544080', 5000),
(NULL, 'DHT11', '50216818214', 5001),
(NULL, 'DHT11', '82090701873', 5001),
(NULL, 'DHT11', '93746182899', 5001),
(NULL, 'DHT11', '33666007310', 5002),
(NULL, 'DHT11', '16355678086', 5002),
(NULL, 'DHT11', '57005645496', 5002),
(NULL, 'DHT11', '25720755420', 5003),
(NULL, 'DHT11', '70689478640', 5003),
(NULL, 'DHT11', '71230487229', 5003),
(NULL, 'DHT11', '82658806305', 5003),
(NULL, 'DHT11', '15070232634', 5004),
(NULL, 'DHT11', '30665270595', 5004),
(NULL, 'DHT11', '29860047723', 5004),
(NULL, 'DHT11', '81562904499', 5004),
(NULL, 'DHT11', '86800276326', 5004),
(NULL, 'DHT11', '80173163661', 5004),
(NULL, 'DHT11', '98079517820', 5005),
(NULL, 'DHT11', '70842554085', 5005);

INSERT INTO medida VALUES
(NULL, 27.33, 48.24, '2022-04-14 13:41:47', 2006),
(NULL, 14.33, 75.72, '2022-04-14 13:41:47', 2021),
(NULL, 28.50, 81.10, '2022-04-14 13:41:47', 2020),
(NULL, 22.47, 64.40, '2022-04-14 13:41:47', 2000),
(NULL, 20.92, 84.57, '2022-04-14 13:41:47', 2005),
(NULL, 27.48, 83.89, '2022-04-14 13:41:47', 2002),
(NULL, 26.22, 54.27, '2022-04-14 13:41:47', 2004),
(NULL, 21.69, 52.29, '2022-04-14 13:41:47', 2021),
(NULL, 015.1, 76.88, '2022-04-14 13:41:47', 2019),
(NULL, 17.31, 72.72, '2022-04-14 13:41:47', 2012),
(NULL, 14.22, 43.73, '2022-04-14 13:41:47', 2017),
(NULL, 15.74, 60.32, '2022-04-14 13:41:47', 2011),
(NULL, 24.32, 52.98, '2022-04-14 13:41:47', 2010),
(NULL, 20.52, 56.80, '2022-04-14 13:41:47', 2020),
(NULL, 21.89, 84.6, '2022-04-14 13:41:47', 2018),
(NULL, 21.14, 71.81, '2022-04-14 13:41:47', 2006),
(NULL, 16.23, 44.53, '2022-04-14 13:41:47', 2015),
(NULL, 26.59, 58.34, '2022-04-14 13:41:47', 2011),
(NULL, 21.80, 77.52, '2022-04-14 13:41:47', 2019),
(NULL, 13.79, 79.93, '2022-04-14 13:41:47', 2001),
(NULL, 20.29, 71.46, '2022-04-14 13:41:47', 2000),
(NULL, 20.6, 71.17, '2022-04-14 13:41:47', 2003),
(NULL, 19.7, 82.54, '2022-04-14 13:41:47', 2003),
(NULL, 14.96, 61.38, '2022-04-14 13:41:47', 2008),
(NULL, 25.11, 84.21, '2022-04-14 13:41:47', 2018),
(NULL, 28.84, 47.78, '2022-04-14 13:41:47', 2014),
(NULL, 17.22, 62.48, '2022-04-14 13:41:47', 2013),
(NULL, 28.87, 65.57, '2022-04-14 13:41:47', 2018),
(NULL, 20.77, 59.77, '2022-04-14 13:41:47', 2006),
(NULL, 15.54, 49.91, '2022-04-14 13:41:47', 2011),
(NULL, 020.7, 43.46, '2022-04-14 13:41:47', 2004),
(NULL, 21.62, 56.11, '2022-04-14 13:41:47', 2014),
(NULL, 22.43, 79.33, '2022-04-14 13:41:47', 2000),
(NULL, 19.15, 50.29, '2022-04-14 13:41:47', 2003),
(NULL, 19.53, 46.23, '2022-04-14 13:41:47', 2020),
(NULL, 25.55, 60.99, '2022-04-14 13:41:47', 2012),
(NULL, 27.84, 54.47, '2022-04-14 13:41:47', 2021),
(NULL, 12.42, 77.68, '2022-04-14 13:41:47', 2004),
(NULL, 14.92, 45.94, '2022-04-14 13:41:47', 2013),
(NULL, 13.57, 56.52, '2022-04-14 13:41:47', 2016),
(NULL, 24.46, 71.28, '2022-04-14 13:41:47', 2012),
(NULL, 27.93, 69.53, '2022-04-14 13:41:47', 2003),
(NULL, 14.48, 54.62, '2022-04-14 13:41:47', 2011),
(NULL, 22.91, 45.50, '2022-04-14 13:41:47', 2014),
(NULL, 14.93, 43.56, '2022-04-14 13:41:47', 2004),
(NULL, 20.60, 42.73, '2022-04-14 13:41:47', 2006),
(NULL, 25.59, 81.65, '2022-04-14 13:41:47', 2002),
(NULL, 16.29, 61.25, '2022-04-14 13:41:47', 2016),
(NULL, 21.66, 82.26, '2022-04-14 13:41:47', 2013),
(NULL, 21.63, 60.41, '2022-04-14 13:41:47', 2021),
(NULL, 20.72, 65.95, '2022-04-14 13:41:47', 2004),
(NULL, 19.44, 49.37, '2022-04-14 13:41:47', 2000),
(NULL, 16.49, 82.12, '2022-04-14 13:41:47', 2020),
(NULL, 28.75, 81.44, '2022-04-14 13:41:47', 2021),
(NULL, 19.44, 47.28, '2022-04-14 13:41:47', 2004),
(NULL, 20.35, 085.1, '2022-04-14 13:41:47', 2002),
(NULL, 22.88, 67.13, '2022-04-14 13:41:47', 2012),
(NULL, 23.10, 73.46, '2022-04-14 13:41:47', 2016),
(NULL, 19.38, 83.54, '2022-04-14 13:41:47', 2009),
(NULL, 13.11, 47.17, '2022-04-14 13:41:47', 2019),
(NULL, 017.9, 40.71, '2022-04-14 13:41:47', 2021),
(NULL, 16.51, 85.11, '2022-04-14 13:41:47', 2003),
(NULL, 23.15, 66.77, '2022-04-14 13:41:47', 2006),
(NULL, 25.85, 058.6, '2022-04-14 13:41:47', 2018),
(NULL, 23.10, 53.22, '2022-04-14 13:41:47', 2016),
(NULL, 21.83, 68.83, '2022-04-14 13:41:47', 2011),
(NULL, 12.93, 66.54, '2022-04-14 13:41:47', 2014),
(NULL, 19.16, 64.17, '2022-04-14 13:41:47', 2021),
(NULL, 18.93, 049.5, '2022-04-14 13:41:47', 2016),
(NULL, 21.98, 73.15, '2022-04-14 13:41:47', 2017),
(NULL, 27.59, 41.43, '2022-04-14 13:41:47', 2018),
(NULL, 013.1, 42.72, '2022-04-14 13:41:47', 2016),
(NULL, 18.10, 68.80, '2022-04-14 13:41:47', 2020),
(NULL, 28.28, 61.65, '2022-04-14 13:41:47', 2000),
(NULL, 12.5, 49.47, '2022-04-14 13:41:47', 2013),
(NULL, 25.37, 41.95, '2022-04-14 13:41:47', 2012),
(NULL, 25.62, 44.97, '2022-04-14 13:41:47', 2020),
(NULL, 015.1, 79.27, '2022-04-14 13:41:47', 2015),
(NULL, 21.95, 50.75, '2022-04-14 13:41:47', 2017),
(NULL, 23.67, 62.79, '2022-04-14 13:41:47', 2006),
(NULL, 23.13, 058.2, '2022-04-14 13:41:47', 2007),
(NULL, 18.94, 76.82, '2022-04-14 13:41:47', 2011),
(NULL, 26.50, 50.57, '2022-04-14 13:41:47', 2003),
(NULL, 25.19, 57.73, '2022-04-14 13:41:47', 2008),
(NULL, 16.62, 65.15, '2022-04-14 13:41:47', 2011),
(NULL, 22.82, 40.77, '2022-04-14 13:41:47', 2009),
(NULL, 20.42, 61.16, '2022-04-14 13:41:47', 2000),
(NULL, 14.30, 45.40, '2022-04-14 13:41:47', 2016),
(NULL, 27.40, 42.63, '2022-04-14 13:41:47', 2015),
(NULL, 13.4, 71.44, '2022-04-14 13:41:47', 2019),
(NULL, 12.12, 50.59, '2022-04-14 13:41:47', 2009),
(NULL, 17.92, 43.60, '2022-04-14 13:41:47', 2012),
(NULL, 024.4, 43.54, '2022-04-14 13:41:47', 2018),
(NULL, 18.93, 68.93, '2022-04-14 13:41:47', 2009),
(NULL, 26.39, 55.30, '2022-04-14 13:41:47', 2009),
(NULL, 26.50, 82.78, '2022-04-14 13:41:47', 2002),
(NULL, 20.57, 44.30, '2022-04-14 13:41:47', 2005),
(NULL, 26.44, 68.98, '2022-04-14 13:41:47', 2012),
(NULL, 24.25, 56.35, '2022-04-14 13:41:47', 2007),
(NULL, 27.21, 41.67, '2022-04-14 13:41:47', 2010),
(NULL, 18.63, 83.8, '2022-04-14 13:41:47', 2007);

SELECT nomeCliente, apelidoEstufa, temperaturaRegistrada, umidadeRegistrada, horarioRegistro 
FROM cliente, estufa, sensor, medida
WHERE idMedida = 10605
AND medida.idSensor = sensor.idSensor
AND sensor.idEstufa = estufa.idEstufa
AND estufa.idCliente = cliente.idCliente;
																		