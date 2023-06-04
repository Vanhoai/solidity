// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Emit {
    // user indexed to allow filtering by user
    event DepositAction(address indexed sender, uint amount, uint balance);

    function deposit() public payable {
        emit DepositAction(msg.sender, msg.value, address(this).balance);
    }
}
