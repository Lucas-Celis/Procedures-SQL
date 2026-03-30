/* DELIMITER E PROCEDURES */

/* COMANDO STATUS MOSTRA TODAS AS INFORMAÇÕES DO BANCO */
STATUS

--------------
C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe  Ver 8.0.44 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          8
Current database:
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_256_GCM_SHA384
Using delimiter:        ;
Server version:         8.0.44 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 5 min 13 sec

Threads: 2  Questions: 5  Slow queries: 0  Opens: 119  Flush tables: 3  Open tables: 38  Queries per second avg: 0.015
--------------

/* ALTERANDO DELIMITADOR */
DELIMITER $

SELECT * FROM V_RELATORIO$

+---------+------+--------------------+------+----------+------------+----------------+--------+
| NOME    | SEXO | E-MAIL             | TIPO | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+---------+------+--------------------+------+----------+------------+----------------+--------+
| JOSE    | M    | JORGE@IG.COM       | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM       | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
| JOAO    | M    | JOAOA@IG.COM       | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM     | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM       | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@IG.COM         | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM         | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| JOAO    | M    | JOAOA@IG.COM       | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOSE    | M    | JORGE@IG.COM       | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | CARLOSA@IG.COM     | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM      | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM      | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| GIOVANA | F    | NÃO POSSUI E-MAIL  | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | NÃO POSSUI E-MAIL  | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | NÃO POSSUI E-MAIL  | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM    | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM  | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | NÃO POSSUI E-MAIL  | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@IG.COM     | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM    | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM   | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM      | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM      | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM  | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM  | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM    | CEL  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+--------------------+------+----------+------------+----------------+--------+

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

/* RETORNANDO O DELIMITADOR PARA O ORIGINAL */
DELIMITER ;

/* CRIAÇÃO DA PROCEDURE SEM PARÂMETRO */
CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;
END
$

DELIMITER ;

/* CHAMANDO A PROCEDURE */

CALL NOME_EMPRESA();

+------------------------+
| EMPRESA                |
+------------------------+
| UNIVERSIDADE DOS DADOS |
+------------------------+

/* PROCEDURE COM PARÂMETRO */
DELIMITER $
	
CREATE PROCEDURE CONTA()
BEGIN
	SELECT 10 + 10 AS CONTA;
END
$

DELIMITER ;

/* CHAMANDO A PROCEDURE */
CALL CONTA();

+-------+
| CONTA |
+-------+
|    20 |
+-------+

/* APAGAR PROCEDURE */

DROP PROCEDURE CONTA$

/* CRIANDO A PROCEDURE COM PARÂMETRO */
DELIMITER $

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	SELECT NUMERO1 + NUMERO2 AS CONTA;
END
$

DELIMITER ;

/* CHAMANDO AS PROCEDURES */
CALL CONTA(100,50);

+-------+
| CONTA |
+-------+
|   150 |
+-------+

CALL CONTA(345634,4354);

+--------+
| CONTA  |
+--------+
| 349988 |
+--------+

CALL CONTA(55654,56760);

+--------+
| CONTA  |
+--------+
| 112414 |
+--------+

CALL CONTA(45646,6766);

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

/* RETORNANDO O DELIMITADOR ORIGINAL */
DELIMITER ;

/* ADICIONANDO MAIS 1 CURSO */
CALL CAD_CURSO('BI SQL SERVER',35,3000.00);

SELECT * FROM CURSO;

+----------+-------------------------------+-------+---------+
| IDCURSOS | NOME                          | HORAS | VALOR   |
+----------+-------------------------------+-------+---------+
|        1 | JAVA                          |    30 |  500.00 |
|        2 | FUNDAMENTOS DE BANCO DE DADOS |    40 |  700.00 |
|        3 | BI SQL SERVER                 |    35 | 3000.00 |
+----------+-------------------------------+-------+---------+

/* ADICIONANDO MAIS 1 CURSO */
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

/* ADICIONANDO MAIS 1 CURSO */
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
