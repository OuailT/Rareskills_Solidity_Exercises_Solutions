// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FizzBuzz {
    // NOTE to know if a Number is divisible by a number we should check the following (a % b == 0)
    function fizzBuzz(uint256 n) public view returns (string memory) {
        // if n is divisible by 3, return "fizz"
        // if n is divisible by 5, return "buzz"
        // if n is divisible by 3 and 5, return "fizz buzz"
        // otherwise, return an empty string
        // SOLUTION:
        if(n % 3 == 0 && n % 5 == 0) {
            return "fizz buzz";
        } else if( n % 3 == 0) {
            return "fizz";
        } else if ( n % 5 == 0) {
            return "buzz";
        } else {
            return "";
        }
    }
}
