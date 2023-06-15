// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageArray {
    // dynamic size
    uint256[] users; // CRUD in array

    function read() public view returns (uint256[] memory) {
        return users;
    }

    function create(uint256 n) public {
        users.push(n);
    }

    function update(uint256 n, uint index) public {
        users[index] = n;
    }

    function remove(uint index) public {
        delete users[index]; // => when delete, it will be replaced by 0
    }
}
