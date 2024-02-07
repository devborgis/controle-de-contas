# Eos - Controle de Contas
Eos é um gerenciador de contas a receber e a pagar baseado em Pascal usando a IDE Lazarus.

## Objetivo
O objetivo desse projeto é desenvolver uma aplicação de controle de contas para uso pessoal, adquirir conhecimento no desenvolvimento de aplicações baseadas em Pascal usando Lazarus, criar uma interface fluida e preparar um sistema robusto para futuras implementações, como a impressão de relatórios.

## Para utilizar 
No momento, a aplicação não possui o executável no repositório. Recomenda-se compilar localmente após verificar a conexão com o banco de dados e realizar o restore database usando o SQLDump em uma base chamada "eos_controle".

<br>

Recomendo este procedimento porque, em meu ambiente de teste, utilizo a senha do banco de dados como "masterkey". Portanto, se a pasta for apenas copiada e o executável for executado, não funcionará corretamente. É necessário garantir que a conexão esteja configurada corretamente e que o banco de dados esteja disponível. Esta situação será resolvida quando um instalador para o programa e o banco de dados for criado.
