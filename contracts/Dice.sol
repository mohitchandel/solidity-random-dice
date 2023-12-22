// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract Dice {
    event Result(bool);
    event DiceNumber(uint8);

    struct Bet {
        uint8 diceNumber;
        uint256 betAmount;
        uint256 winAmount;
        bool win;
        bool played;
    }
    mapping(address => Bet) bet;

    function placeBetAndPlay(uint8 diceNumber) external payable {
        require(msg.value > 0, "PlaceBet: Amount can't be zero");
        bet[msg.sender] = Bet(diceNumber, msg.value, 0, false, true);
        uint8 res = _rollDice();
        emit DiceNumber(res);
        if (res == diceNumber) {
            _payReward(payable(msg.sender));
            emit Result(true);
        } else {
            emit Result(false);
        }
    }

    function _rollDice() internal view returns (uint8) {
        uint256 randomNumber = uint256(
            keccak256(
                abi.encodePacked(
                    block.timestamp,
                    block.prevrandao,
                    block.number
                )
            )
        );
        return uint8((randomNumber % 6) + 1);
    }

    function _payReward(address payable player) internal {
        bet[player].winAmount = _calculateReward(player);
        player.transfer(bet[player].winAmount);
        // Reset data
        bet[player] = Bet(0, 0, 0, false, false);
    }

    function _calculateReward(address player) internal view returns (uint256) {
        uint256 reward = bet[player].betAmount +
            (bet[player].betAmount * 20) /
            100;
        return reward;
    }
}
