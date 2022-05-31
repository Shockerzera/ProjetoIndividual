create database harrypotter;
use harrypotter;

CREATE TABLE casa(
    idCasa INT PRIMARY KEY AUTO_INCREMENT,
    nomeCasa VARCHAR(64)
);


CREATE TABLE cliente(
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(64),
    emailCliente varchar(64),
    senha varchar(64),
    fkCasa INT,
    FOREIGN KEY (fkCasa) REFERENCES casa (idCasa)
);

CREATE TABLE quiz (
    idTentativa INT PRIMARY KEY AUTO_INCREMENT,
    pontos INT,
    fkCliente INT,
    FOREIGN KEY (fkCliente) REFERENCES cliente (idCliente)
);

INSERT INTO casa VALUES
(NULL, 'Grifnória'),
(NULL, 'Sonserina'),
(NULL, 'Lufa lufa'),
(NULL, 'Corvinal');

SELECT * FROM casa;
SELECT * FROM cliente;
SELECT * FROM quiz;

insert into quiz values (1, 0, 1); -- Insert dos pontos do cliente
insert into quiz values (2, 0, 2); -- Insert dos pontos do cliente
insert into quiz values (3, 0, 3); -- Insert dos pontos do cliente
insert into quiz values (4, 0, 4); -- Insert dos pontos do cliente



SELECT SUM(pontos) as 'Pontos', nomeCasa FROM quiz JOIN cliente ON fkCliente = idCliente JOIN casa ON fkCasa = idCasa GROUP BY nomeCasa;

truncate table quiz; -- Limpar dados dos quizes
