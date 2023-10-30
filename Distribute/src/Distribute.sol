// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Distribute {
    /*
        This exercise assumes you know how to sending Ether.
        1. This contract has some ether in it, distribute it equally among the
           array of addresses that is passed as argument.
        2. Write your code in the `distributeEther` function.
    */

    constructor() payable {}

    function distributeEther(address[] memory addresses) public {
        
        require(addresses.length != 0, "EMPTY_ARRAY");

        // Get the balance of this contract in Ether
        uint256 contractBal = address(this).balance;

        uint256 equalAmount = (contractBal / addresses.length);

        for(uint256 i = 0; i < addresses.length; i++) {
            (bool success, ) = addresses[i].call{value : equalAmount}("");
            require(success, "tx failed");
        }

    }
}
