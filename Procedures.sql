/* STORED PROCEDURES */

SELECT 'CELIS';

+-------+
| CELIS |
+-------+
| CELIS |
+-------+

/* ALTERANDO O DELIMITADOR */
DELIMITER $

/* LÓGICA DA PROCEDURE */
CREATE PROCEDURE NOME()
BEGIN
	/* PROGRAMAÇÃO VAI AQUI */
END
$

/* CRIAÇÃO DA PROCEDURE SEM PARÂMETRO */
CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;
END
$

+------------------------+
| EMPRESA                |
+------------------------+
| UNIVERSIDADE DOS DADOS |
+------------------------+

/* CHAMANDO A PROCEDURE */

CALL NOME_EMPRESA()$

/* PROCEDURE COM PARÂMETRO */

CREATE PROCEDURE CONTA()
BEGIN
	SELECT 10 + 10 AS CONTA;
END
$


/* CHAMANDO A PROCEDURE */
CALL CONTA()$

+-------+
| CONTA |
+-------+
|    20 |
+-------+

/* APAGAR PROCEDURE */

DROP PROCEDURE CONTA$

/* CRIANDO A PROCEDURE COM PARÂMETRO */
CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	SELECT NUMERO1 + NUMERO2 AS CONTA;
END
$

/* CHAMANDO AS PROCEDURES */
CALL CONTA(100,50)$

+-------+
| CONTA |
+-------+
|   150 |
+-------+

CALL CONTA(345634,4354)$

+--------+
| CONTA  |
+--------+
| 349988 |
+--------+

CALL CONTA(55654,56760)$

+--------+
| CONTA  |
+--------+
| 112414 |
+--------+

CALL CONTA(45646,6766)$

+-------+
| CONTA |
+-------+
| 52412 |
+-------+


/* PROCEDURES COM QUERY */
CREATE DATABASE CRIANDOPROCEDURES;

USE CRIANDOPROCEDURES;

CREATE TABLE CURSO(
	IDCURSOS INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSO VALUES(NULL, 'JAVA', 30, 500.00);
INSERT INTO CURSO VALUES(NULL, 'FUNDAMENTOS DE BANCO DE DADOS', 40, 700.00);

DELIMITER $

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30), P_HORAS INT(3),P_PRECO FLOAT(10,2))
BEGIN
	INSERT INTO CURSO VALUES(NULL,P_NOME,P_HORAS,P_PRECO);
END
$

DELIMITER ;

CALL CAD_CURSO('BI SQL SERVER',35,3000.00);

SELECT * FROM CURSO;

+----------+-------------------------------+-------+---------+
| IDCURSOS | NOME                          | HORAS | VALOR   |
+----------+-------------------------------+-------+---------+
|        1 | JAVA                          |    30 |  500.00 |
|        2 | FUNDAMENTOS DE BANCO DE DADOS |    40 |  700.00 |
|        3 | BI SQL SERVER                 |    35 | 3000.00 |
+----------+-------------------------------+-------+---------+

CALL CAD_CURSO('POWER BI',20,1000.00);

SELECT * FROM CURSO;

+----------+-------------------------------+-------+---------+
| IDCURSOS | NOME                          | HORAS | VALOR   |
+----------+-------------------------------+-------+---------+
|        1 | JAVA                          |    30 |  500.00 |
|        2 | FUNDAMENTOS DE BANCO DE DADOS |    40 |  700.00 |
|        3 | BI SQL SERVER                 |    35 | 3000.00 |
|        4 | POWER BI                      |    20 | 1000.00 |
+----------+-------------------------------+-------+---------+

CALL CAD_CURSO('TABLEAU',30,1200.00);

SELECT * FROM CURSO;

+----------+-------------------------------+-------+---------+
| IDCURSOS | NOME                          | HORAS | VALOR   |
+----------+-------------------------------+-------+---------+
|        1 | JAVA                          |    30 |  500.00 |
|        2 | FUNDAMENTOS DE BANCO DE DADOS |    40 |  700.00 |
|        3 | BI SQL SERVER                 |    35 | 3000.00 |
|        4 | POWER BI                      |    20 | 1000.00 |
|        5 | TABLEAU                       |    30 | 1200.00 |
+----------+-------------------------------+-------+---------+

/* OBJETIVO: CRIAR UMA PROCEDURE PARA CONSULTAR CURSOS */

DELIMITER $

CREATE PROCEDURE CONS_CURSO(P_NOME VARCHAR(30))
BEGIN
	SELECT NOME, HORAS, VALOR 
	FROM CURSO
	WHERE NOME = P_NOME;
END
$

DELIMITER ;

CALL CONS_CURSO('POWER BI');

+----------+-------+---------+
| NOME     | HORAS | VALOR   |
+----------+-------+---------+
| POWER BI |    20 | 1000.00 |
+----------+-------+---------+