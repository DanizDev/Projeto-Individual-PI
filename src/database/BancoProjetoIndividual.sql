CREATE DATABASE projetoIndividual;
USE projetoIndividual;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
    conheceSerie BOOLEAN DEFAULT NULL
);

CREATE TABLE personagem(
	idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(55)
);

CREATE TABLE pergunta(
idPergunta INT PRIMARY KEY AUTO_INCREMENT,
texto VARCHAR(255),
fkPersonagem INT,
CONSTRAINT fkpergunPerso FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE alternativa(
	idAlternativa INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(255),
    certa BOOLEAN,
    fkPergunta INT,
    CONSTRAINT fkpergunAlter FOREIGN KEY (fkPergunta) REFERENCES pergunta(idPergunta)
);

CREATE TABLE respostas(
	idRespostas INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT,
    fkPergunta INT,
    fkAlternativa INT,
    acertou BOOLEAN,
    dataResposta DATETIME DEFAULT NOW(),
    CONSTRAINT fkrespostUser FOREIGN KEY (fkUsuario) REFERENCES usuario(id),
    CONSTRAINT fkrespostPergunt FOREIGN KEY (fkPergunta) REFERENCES pergunta(idPergunta),
    CONSTRAINT fkrespostAlter FOREIGN KEY (fkAlternativa) REFERENCES alternativa(idAlternativa)
);

CREATE TABLE resultadoQuiz(
	idResultado INT PRIMARY KEY AUTO_INCREMENT
);

SELECT * FROM usuario;

CREATE USER 'Daniel'@'localhost' IDENTIFIED BY 'senha';

GRANT ALL PRIVILEGES ON projetoIndividual.* TO 'Daniel'@'localhost';

ALTER USER 'Daniel'@'localhost'
IDENTIFIED BY 'sptechH@gure789';

FLUSH PRIVILEGES;











