// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

// import "hardhat/console.sol";

// graph inheritance
//     A
//    / \
//   B   C
//    \ /
//     D

contract A {
    struct User {
        uint256 id;
        string name;
    }

    User[] public users;

    function addUser(uint256 id, string memory name) public virtual {
        users.push(User(id, name));
    }

    function updateUser(
        uint256 id,
        string memory name
    ) public virtual returns (User memory updated) {
        for (uint256 i = 0; i < users.length; i++) {
            if (id == users[i].id) {
                users[i].name = name;
                return users[i];
            }
        }
    }

    function removeUser(
        uint256 id
    ) public virtual returns (User memory removed) {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i].id == id) {
                User memory user = users[i];
                delete users[i];
                return user;
            }
        }
    }

    function findUser(
        uint256 id
    ) public view virtual returns (User memory found) {
        for (uint256 i = 0; i < users.length; i++) {
            if (id == users[i].id) {
                return users[i];
            }
        }
    }
}

contract B is A {
    function addUser(uint256 id, string memory name) public virtual override {
        super.addUser(id, name);
    }

    function updateUser(
        uint256 id,
        string memory name
    ) public virtual override returns (User memory updated) {
        for (uint256 i = 0; i < users.length; i++) {
            if (id == users[i].id) {
                users[i].name = name;
                return users[i];
            }
        }
    }
}

contract C is A {
    function removeUser(
        uint256 id
    ) public virtual override returns (User memory removed) {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i].id == id) {
                User memory user = users[i];
                delete users[i];
                return user;
            }
        }
    }

    function findUser(
        uint256 id
    ) public view virtual override returns (User memory found) {
        for (uint256 i = 0; i < users.length; i++) {
            if (id == users[i].id) {
                return users[i];
            }
        }
    }
}

contract D is B, C {
    function addUser(uint256 id, string memory name) public override(A, B) {
        super.addUser(id, name);
    }

    function updateUser(
        uint256 id,
        string memory name
    ) public override(A, B) returns (User memory updated) {
        for (uint256 i = 0; i < users.length; i++) {
            if (id == users[i].id) {
                users[i].name = name;
                return users[i];
            }
        }
    }

    function removeUser(
        uint256 id
    ) public override(A, C) returns (User memory removed) {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i].id == id) {
                User memory user = users[i];
                delete users[i];
                return user;
            }
        }
    }

    function findUser(
        uint256 id
    ) public view override(A, C) returns (User memory found) {
        for (uint256 i = 0; i < users.length; i++) {
            if (id == users[i].id) {
                return users[i];
            }
        }
    }
}
