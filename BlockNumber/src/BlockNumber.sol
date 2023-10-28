// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BlockNumber {
    /**
     * In this exercise the function lastCaller stores the address of the caller of the function in the lastCaller stateVariable
     * The task is to make this function only callable once per block.
     * If it is called more than once per block, the second and later calls revert.
     * To pass the test, it needs a storage variable that stores the last blocknumber where it was accessed.
     */

    address public lastCaller;
    uint256 public lastBlockNumber;

    function callMe() external {
        /**
            SOLUTION: Check if the current block.number is greater than the previously recordered block.number. 
            If it isn't, the function will revert. This will make sure than we don't call the 
            function within the same block
        */ 
        require(block.number > lastBlockNumber, "This function has already been called in this block");

        lastBlockNumber = block.number;
        lastCaller = msg.sender;
    }
}
