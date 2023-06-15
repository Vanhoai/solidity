// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

// import "hardhat/console.sol";

// Contract Interations

contract User {
    string public name;
    uint256 public age;

    constructor(string memory _name, uint256 _age) {
        name = _name;
        age = _age;
    }
}

contract Array {
    mapping(address => User) public users;

    // give me CRUD with mapping users
    // create
    function createUser(string memory name, uint256 age) public {
        User user = new User(name, age);
        users[msg.sender] = user;
    }

    // read
    function getUser(
        address _user
    ) public view returns (string memory, uint256) {
        User user = users[_user];
        return (user.name(), user.age());
    }
}
