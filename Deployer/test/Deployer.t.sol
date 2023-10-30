// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol"; 
import "../src/Deployer.sol";

contract DeployerTest is Test {
    Deployer public deployer;

    function setUp() public {
        deployer = new Deployer("Hello Solidity");
    }

    function testGreeting() public {

        string memory greeting = deployer.greeting();

        // console.logBytes(abi.encode(greeting));
        // console.logBytes(abi.encode("Hello Solidity"));

        assertEq(
            keccak256(abi.encode(greeting)),
            keccak256(abi.encode("Hello Solidity"))
        );
    }
}
