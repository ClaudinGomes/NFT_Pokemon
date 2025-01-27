// SPDX-License-Identifier: GPL-3.0
// Especifica a licença do código, tornando-o aberto sob os termos da GPL 3.0.

pragma solidity ^0.8.0;
// Define a versão do Solidity usada no contrato.

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// Importa o contrato padrão ERC721 da OpenZeppelin para criar NFTs.

contract PokeDIO is ERC721 {
    // Define o contrato PokeDIO que herda funcionalidades do padrão ERC721.

    struct Pokemon {
        string name; // Nome do Pokémon.
        uint level;  // Nível do Pokémon.
        string img;  // URL ou identificador da imagem do Pokémon.
    }

    Pokemon[] public pokemons;
    // Um array público para armazenar todos os Pokémons criados.

    address public gameOwner;
    // Endereço do proprietário do jogo (quem implanta o contrato).

    constructor() ERC721("PokeDIO", "PKD") {
        // Define o nome e o símbolo do token ERC721 (NFT).
        gameOwner = msg.sender;
        // Define o endereço que implantou o contrato como o proprietário do jogo.
    }

    modifier onlyOwner(uint _monsterId) {
        // Modificador que verifica se o chamador da função é o dono de um Pokémon específico.
        require(ownerOf(_monsterId) == msg.sender, "Only the owner can battle this POKEMON !!!");
        _;
    }

    function battle(uint _attackingPokemon, uint _defendingPokemon) public onlyOwner(_attackingPokemon) {
        // Função para batalhar entre dois Pokémons.
        // Requer que o chamador seja o dono do Pokémon atacante.
        
        Pokemon storage attacker = pokemons[_attackingPokemon];
        // Referência ao Pokémon atacante no array `pokemons`.
        
        Pokemon storage defender = pokemons[_defendingPokemon];
        // Referência ao Pokémon defensor no array `pokemons`.

        if (attacker.level >= defender.level) {
            // Se o nível do atacante for maior ou igual ao do defensor:
            attacker.level += 2; // O atacante ganha 2 níveis.
            defender.level += 1; // O defensor ganha 1 nível.
        } else {
            // Caso contrário:
            attacker.level += 1; // O atacante ganha 1 nível.
            defender.level += 2; // O defensor ganha 2 níveis.
        }
    }

    function createNewPokemon(string memory _name, address _to, string memory _img) public {
        // Função para criar um novo Pokémon.
        // Parâmetros:
        // - `_name`: Nome do Pokémon.
        // - `_to`: Endereço que receberá o Pokémon.
        // - `_img`: URL ou identificador da imagem do Pokémon.
        
        require(msg.sender == gameOwner, "Only the owner of the game can breed new Pokemons !!!");
        // Somente o proprietário do jogo pode criar novos Pokémons.
        
        uint id = pokemons.length;
        // O ID do novo Pokémon será igual ao tamanho atual do array `pokemons`.
        
        pokemons.push(Pokemon(_name, 1, _img));
        // Adiciona o novo Pokémon ao array com nível inicial 1.

        _safeMint(_to, id);
        // Usa a função `_safeMint` do ERC721 para criar um novo NFT e associá-lo ao endereço `_to`.
    }
}
