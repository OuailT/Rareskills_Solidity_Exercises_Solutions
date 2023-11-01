// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ListOfNumbers {
    uint256[] private arr;

    /// let caller append @param number to the array "arr"
    function appendToArray(uint256 number) public {
        arr.push(number);
    }

    /// return arr
    function getArray() public view  returns (uint256[] memory) {

        uint arrLength = arr.length;

        uint256[] memory newArr = new uint256[](arrLength);
        
        for(uint256 i = 0; i < arrLength; i++) {
            newArr[i] = arr[i];
        }
        return newArr;

    }
}
