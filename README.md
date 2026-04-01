# Procedures-SQL
🔷 Comando STATUS:
No MySQL muitas das vezes nos perguntamos em qual database estamos? Ou quanto tempo determinada database está de pé? Isso pode ser esclarecido com o comando STATUS, nele é possível ver os status do banco, onde é mostrado quanto tempo ele está aberto, qual o delimitador está sendo usado, o repositório do banco, versão do servidor, porta TCP, qual database está em uso no momento, entre outras informações. Estas informações podem ser muito úteis no dia-a-dia dentro das empresas e pode auxiliar muito os funcionários.

🔷 DELIMITER (Delimitador):
DELIMITER ou Delimitador no MySQL é o símbolo na qual é determinado quando aquele bloco de comandos/ações está concluído para o banco realizar o que está sendo pedido. Ou seja, ao escrever o comando "SELECT * FROM CLIENTE" e ficar apertando a tecla "Enter" sem o ";" que é o padrão do MySQL esta linha ficará presa em looping esperando o delimitador aparecer. Sendo possível alterar este delimitador para outro símbolo na qual o desenvolvedor preferir.

🔷 DELIMITER como alterar?
Para alterar é simples "DELIMITER $" apenas digitar esta linha e seu delimitador já foi alterado.

🔷 Se o ";" é o delimitador padrão por qual motivo devemos trocar?
Ai que entra o assunto chave de hoje. No MySQL é possível criar PROCEDURES que são rotinas definidas no banco de dados que permitem executar uma série de instruções, retornar valores ou receber parâmetros. E essas Procedures ao criá-las é necessário escrever a linha dos comandos utilizando o ";" e caso esse seja o delimitador ele dará erro no código.

🔷 PROCEDURES:
Como dito anteriormente Procedures são rotinas definidas no banco de dados, mas para que são úteis? Simples elas podem possuir dentro delas por exemplo uma sequência para armazenar dados de cursos de forma mais fácil e prática no banco, o que otimiza o banco. 
Como funciona a Procedure? Para criar uma procedure primeiro precisamos alterar o delimitador padrão (pode ser qualquer símbolo que o dev preferir), por exemplo "DELIMITER $" aqui alteramos o delimitador, posteriormente devemos seguir a lógica da criação da Procedure que é
"CREATE PROCEDURE NOME_PROCEDURE(PARAMETROS)
 BEGIN
 AQUI VAI A LÓGICA;
 END
 $"
Onde a procedure pode ou não possuir parâmetros.

🔷 Criamos a Procedure, agora como chamar?
Primeiramente, voltamos o delimitador para o ";" como visto anteriormente. Após isso para chamar uma Procedure basta digitar "CALL NOME_PROCEDURE(PARÂMETRO);"
