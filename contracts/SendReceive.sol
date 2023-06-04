// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

// import "hardhat/console.sol";

contract ETH {
    function sendEther(address payable to, uint256 amount) public {
        // use payable to send ether
        // when use payable, the address will have a transfer function
        to.transfer(amount); // Wei unit: 1 Wei = 1 Ether / 10^18
    }

    function buyEther() external payable {
        // use payable => ether will be sent to this contract and save in msg.value
        // Surplus ether will be save in address(this).balance
    }

    receive() external payable {
        // receive ether
    }
}
