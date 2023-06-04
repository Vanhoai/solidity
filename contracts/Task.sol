// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Task {
    struct User {
        uint256 id;
        string name;
        uint256 balance;
    }

    User[] public users;
}
