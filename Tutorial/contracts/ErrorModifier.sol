// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

// import "hardhat/console.sol";

contract ETH {
    // throw, assert, revert
    // require

    function handleError(
        uint256 a,
        uint256 b
    ) public pure checkNotZero(a) checkNotZero(b) returns (uint256) {
        uint256 c = a / b;
        return c;
    }

    modifier checkNotZero(uint256 n) {
        require(n != 0, "n is zero");
        _;
    }
}
