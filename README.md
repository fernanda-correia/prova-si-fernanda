## Regras de Negócio

As regras de negócio utilizadas para garantir a segurança e o bom uso do sistema são:
- Somente o deployador (admin) do contrato pode criar jogos.
- Para criar um jogo é necessário setar o endereço da carteira dos jogadores (sua identificação) e a escolha de cada um deles.
- O admin é responsável por setar o vencedor.

## Funcionamento

Um jogo é criado pelo administrador do jogos 

<div align="center">
<img src="assets/jogo-funcionando.png">
</div>

Somente o administrador do código pode adicionar novos jogos, se não, a transação é revertida

<div align="center">
<img src="assets/jogo-nao-funcionando.png">
</div>

Um contador atualiza o número de jogos existentes.

<div align="center">
<img src="assets/contador.png">
</div>

Infelizmente não foi possível fazer o armazenador de jogos funcionar, uma vez que ele não consegue armazenar os dados dentro do array.
