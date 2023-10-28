// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CodeSize {

 
    /**
     * The challenge is to create a contract whose runtime code (bytecode) size is greater than 1kb but less than 4kb
     * Solution: The runtime bytescode of this contract is "1632kb".
     * Tip: In your foundry test, use console.log(address(codeSize).code.length) to verify if the size is within the 1kb to 4kb range.
     * Note : Upon contract compilation, we get both the creation bytecode and the runtime bytecode. Ensure you calculate the size of the runtime bytecode,
     *        as it's the only bytecodes that persists after contract deployment.
     */

      
    uint256[500] public data; 
    
    struct DataList {
        uint256 num;
        string name;
        string country;
        address owner;
    }

    // Create an instance of the struct
    DataList public globalData;

    constructor() {
        
    }

    function setData(uint256 _index, uint256 _value) public {
        require( _index >= 500, "Cannot be more than 500");
        for (uint256 i = 500; i < data.length; i++) {
            data[_index] =  _value;
        }
        
    }


    function getData(uint _index) public view returns(uint256) {
        return data[_index]; 
    }
    
    function hashedDataList() external pure returns(bytes32) {
        DataList memory dataList;

        bytes32 hashedata = keccak256(
            abi.encode(
                dataList.num,
                dataList.name,
                dataList.country,
                dataList.owner
            )
        );
        return hashedata;
    }


    function setDataListValues() external {
        globalData.num = 10;
        globalData.name = "Jhon";
        globalData.country = "Sweden";
        globalData.owner = msg.sender;
    }

}
