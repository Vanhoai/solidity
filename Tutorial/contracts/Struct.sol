// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Struct {
    struct User {
        uint256 uid;
        address add;
        string name;
    }

    User[] public userArray;
    mapping(address => User) public userMapping;

    function handleForUserArray() public {
        User memory user = User({uid: 1, add: msg.sender, name: "John"});
        userArray.push(user);

        // search with address
        for (uint256 i = 0; i < userArray.length; i++) {
            if (userArray[i].add == msg.sender) {
                // do something
            }
        }

        // update with address
        for (uint256 i = 0; i < userArray.length; i++) {
            if (userArray[i].add == msg.sender) {
                userArray[i].name = "John Doe";
            }
        }

        // delete with address
        for (uint256 i = 0; i < userArray.length; i++) {
            if (userArray[i].add == msg.sender) {
                delete userArray[i];
            }
        }
    }

    function handleForMapping() public {
        User memory user = User({uid: 1, add: msg.sender, name: "John"});
        userMapping[msg.sender] = user;

        // search with address
        if (userMapping[msg.sender].add == msg.sender) {
            // do something
        }

        // update with address
        userMapping[msg.sender].name = "John Doe";

        // delete with address
        delete userMapping[msg.sender];
    }
}
