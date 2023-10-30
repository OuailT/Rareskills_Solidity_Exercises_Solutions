// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Divide {
    uint256 public constant PERCENTAGE_INTEREST = 3;

    /**
     * The calculate interst function is buggy because of how it calculates interest of amount parsed into it
     * Make it return the right value.
     * NOTE: There's a division-before-multiplication bug in the calculateInterest function below. Specifically,
            the PERCENTAGE_INTEREST constant variable is set to 3. When divided by 100, it should return 0.03. However,
            due to Solidity's integer rounding, it rounds down to 0. As a result, x will always be 0.    
     */

    function calculateInterest(uint256 amount) external pure returns (uint256) {
        uint256 x = (amount * PERCENTAGE_INTEREST) / 100;
        return x;
    }
}
