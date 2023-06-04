// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
    // mapping is a key value store
    mapping(address => uint256) public balances;
    // nested mapping
    mapping(address => mapping(address => uint256)) public allowance;

    // address => address => uint256

    function update(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }

    function read(address userAddress) public view returns (uint256) {
        // if get called with an address that is not in the mapping, it will return 0
        return balances[userAddress];
    }

    function remove(address userAddress) public {
        delete balances[userAddress];
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function readNestd(
        address userAddress,
        address spender
    ) public view returns (uint256) {
        return allowance[userAddress][spender];
    }
}
