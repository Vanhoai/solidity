// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Array {
    // if array use in internal, public => memory
    function callback(uint256[] memory args) internal {}

    // if array use in external => calldata
    function callback2(uint256[] calldata args) external {}
}
