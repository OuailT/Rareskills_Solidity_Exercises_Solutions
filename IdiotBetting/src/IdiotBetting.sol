// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.

        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.

        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */


    uint public highestDeposit;
    uint public endTime;
    address public winner;


    function bet() public payable {
        require(msg.value > 0, "VALUE_CANNOT_BE_ZERO");

        if(msg.value > highestDeposit) { 
            highestDeposit = msg.value;
            endTime = block.timestamp + 1 hours; 
            winner = msg.sender;
        }
    }


    function claimPrize() public {
        require (winner == msg.sender, "UNAUTHORIZED_CALLER");
        require (block.timestamp >= endTime, "INVALID_PERIOD");
        uint contractBal = address(this).balance;
        (bool success, ) = payable(msg.sender).call{value: contractBal}("");
        require(success, "TX FAILED");
    
    }
    
}
