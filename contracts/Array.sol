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

    function operators()
        public
        pure
        returns (uint256, uint256, uint256, uint256, uint256, uint256)
    {
        uint256 a = 10;
        uint256 b = 5;

        uint256 c = a << 2; // 40
        uint256 d = a ^ b; // 15
        uint256 e = a | b; // 15
        uint256 f = a & b; // 0
        uint256 g = a >> 2; // 2
        uint256 h = ~a; // 18446744073709551605

        return (c, d, e, f, g, h);
    }
}
