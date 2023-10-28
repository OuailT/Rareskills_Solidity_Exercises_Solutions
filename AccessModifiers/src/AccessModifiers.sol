// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

// You may modify this contract
contract Parent {
    uint256 internal _value; // internal instead of private
}

contract Child is Parent {
    /*
        This exercise assumes you understand how access modifiers works.
        1. `_value` variable is private and can only be accessed by `Parent` contract. Make the variable accessible
           to `Parent` and `Child` contract ONLY.

        Exercise solution: Declare "_value" using the internal access modifier. _value can only be accessed and modified within the Parent contract and any contract that inherits from it,
        such as the Child contract in this case.
    */

    function setValue(uint256 newValue) public {
        _value = newValue;
    }

    function getValue() public view returns (uint256) {
        return _value;
    }
}
