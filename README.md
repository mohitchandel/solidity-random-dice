# Dice Contract

The Dice contract is a simple Solidity smart contract that simulates a dice game. Players can place a bet by specifying a dice number, and if the generated random number matches the chosen dice number, the player wins a reward.

## Contract Details

- **Solidity Version**: ^0.8.9

## Contract Functions

### `placeBetAndPlay(uint8 diceNumber) external payable`

Allows a player to place a bet by specifying a `diceNumber` and sending a payable amount. If the random number generated matches the `diceNumber`, the player wins a reward.

### Internal Functions

- `_rollDice() internal view returns (uint8)`: Generates a random number representing the dice roll.
- `_payReward(address payable player) internal`: Pays the winning amount to the player.
- `_calculateReward(address player) internal view returns (uint256)`: Calculates the reward for the player based on the bet amount.

## Getting Started

### Prerequisites

- Node.js (v18.x or later)
- npm (Node.js package manager)
- Hardhat

### Installation

1. Clone this repository.

2. Install dependencies: `npm i`

3. Compile the contracts: `npx hardhat compile`

## Contract Deployment

To deploy the Dice contract to a local Ethereum network, you can use Hardhat's deployment scripts or deploy it on a testnet or mainnet by providing appropriate network configurations and deploying using a script or Hardhat tasks.

## Contributing

Contributions to the Dice contract or its associated functionality are welcome. If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.
