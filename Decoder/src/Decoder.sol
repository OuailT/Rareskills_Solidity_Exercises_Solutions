// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Decoder {
    /* This exercise assumes you know how abi decoding works.
        1. In the `decodeData` function below, write the logic that decodes a `bytes` data, based on the function parameters
        2. Return the decoded data
        SOLUTION: abi.decode used to decode raw data (bytes). the function takes the data as its first argument and the return
                  types as it's second argument
    */
    bytes public encoded;

    function decodeData(
        bytes memory _data
    ) public pure returns (string memory, uint256) {
        return abi.decode(_data, (string, uint256));
    }
}

