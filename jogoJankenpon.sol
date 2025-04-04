// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract jogoJankenpon{

    struct Jogada { // Jogada se refere a uma jogada de uma partida
        uint256 numeroJogo;
        address jogador1;
        address jogador2;
        uint256 escolhaJogador1;
        uint256 escolhaJogador2;
        uint256 vencedor;
    }
    address public admin;

    constructor() {
        admin = msg.sender; // Define quem implanta o contrato como dono
    }

    mapping(uint256 => Jogada) public jogadas;
    uint256 public contadorJogada;
    event jogoCriado(uint numeroJogo, uint256 indexed vencedor);


    function criarJogo(uint256 numeroJogo, address jogador1, address jogador2, uint256 escolhaJogador1, uint256 escolhaJogador2, uint256 vencedor) external {
        require(msg.sender == admin, "Apenas o dono pode criar jogos.");
        contadorJogada++; // Incrementa o contador de jogadas
        jogadas[contadorJogada] = Jogada(numeroJogo, jogador1, jogador2, escolhaJogador1, escolhaJogador2, vencedor);
        emit jogoCriado(numeroJogo, vencedor);
    }

    function verificarJogo(uint256 numeroJogo) external view returns (uint256[] memory jogoId, uint256[] memory vencedor) {

        uint256 count = 0;
        // Conta quantos pedidos existem para o jogo solicitado
        for (uint256 i = 1; i <= contadorJogada; i++) {
            if (jogadas[i].numeroJogo == numeroJogo) {
                count++;
            }
        }

        // Inicializa os arrays para armazenar os IDs e os valores
        jogoId = new uint256[](count);
        vencedor = new uint256[](count);

        uint256 index = 0;
        // Preenche os arrays com os IDs dos pedidos e seus valores
        for (uint256 i = 1; i <= contadorJogada; i++) {
            if (jogadas[i].vencedor == numeroJogo) {
                jogoId[index] = i;
                jogoId[index] = jogadas[i].vencedor;
                index++;
            }
        }
    }
}
