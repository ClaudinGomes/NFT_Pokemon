# PokeDIO - Um Jogo NFT baseado em Pokémon 🐾

**PokeDIO** é um contrato inteligente desenvolvido em Solidity que implementa um jogo baseado no padrão ERC721 (NFTs). Ele permite criar, gerenciar e batalhar com Pokémons, combinando o mundo dos jogos com a tecnologia blockchain.

---

## 📝 Descrição do Contrato

O contrato implementa as seguintes funcionalidades:

1. **Criação de Pokémons**:
   - Apenas o proprietário do jogo pode criar novos Pokémons.
   - Cada Pokémon é representado por um NFT com atributos como nome, nível e uma imagem.
   - As imagens dos Pokémons são armazenadas no IPFS para garantir descentralização e imutabilidade.

2. **Sistema de Batalha**:
   - Os Pokémons podem batalhar entre si, e os níveis de ambos aumentam com base no resultado.
   - Apenas o dono do Pokémon atacante pode iniciar uma batalha.

3. **Armazenamento de Dados**:
   - Todos os Pokémons criados são armazenados em um array público.

---

## 🚀 Funcionalidades Principais

### Modificador: `onlyOwner`
Garante que apenas o dono de um Pokémon possa iniciar uma batalha com ele.

### Função: `battle`
Permite que dois Pokémons batalhem. O nível de ambos aumenta com base no seguinte critério:

- Se o atacante tem nível maior ou igual ao do defensor:
  - Atacante ganha **2 níveis**.
  - Defensor ganha **1 nível**.
- Caso contrário:
  - Atacante ganha **1 nível**.
  - Defensor ganha **2 níveis**.

### Função: `createNewPokemon`
Permite ao proprietário do jogo criar um novo Pokémon. A função exige:
- **Nome do Pokémon.**
- **Endereço do destinatário do NFT.**
- **URL da imagem associada ao Pokémon**, armazenada no IPFS.

---

## 📂 Estrutura do Projeto

- **Contrato Principal**:
  - `PokeDIO.sol`: Contém o código do contrato inteligente.

- **Dependências**:
  - OpenZeppelin ERC721: Implementa o padrão ERC721 para criar e gerenciar NFTs.

- **Subpasta de Testes**:
  - **IMAGENS**: Contém prints dos testes realizados no contrato, incluindo:
    - Criação de Pokémons.
    - Execução de batalhas.
    - Validação de regras de propriedade.

---

## 🛠️ Como Usar

### Pré-requisitos
1. Instale o [Node.js](https://nodejs.org/) e o [npm](https://www.npmjs.com/).
2. Instale o [Ganache](https://trufflesuite.com/ganache/) para configurar uma rede blockchain local.

### Passos para Implantar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seuusuario/pokedio.git
   ```
2. Instale as dependências do projeto:
   ```bash
   npm install
   ```
3. Compile o contrato:
   ```bash
   npx hardhat compile
   ```
4. Implante o contrato na rede local configurada no Ganache:
   ```bash
   npx hardhat run scripts/deploy.js --network localhost
   ```

### Interação com o Contrato
Após a implantação, você pode usar ferramentas como o [Remix IDE](https://remix.ethereum.org/) ou scripts personalizados para interagir com o contrato, criar Pokémons e realizar batalhas.

---

## 📸 Subpasta IMAGENS

A subpasta `IMAGENS` contém prints de tela detalhando os testes realizados no contrato, incluindo:
- Criação de novos Pokémons.
- Batalhas entre Pokémons.
- Validação de requisitos e mensagens de erro.
- Referências às imagens armazenadas no IPFS e seus hashes correspondentes.

Esses prints servem como documentação prática para verificar o funcionamento do contrato e suas regras.

---

## 📄 Licença

Este projeto está licenciado sob os termos da **GPL-3.0**. Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 🛡️ Aviso Legal

Este contrato foi desenvolvido apenas para fins educacionais e de demonstração. Antes de usá-lo em um ambiente de produção, recomenda-se realizar auditorias detalhadas e validar todas as funcionalidades.

---

Se tiver dúvidas ou sugestões, sinta-se à vontade para contribuir com o projeto! 🚀
