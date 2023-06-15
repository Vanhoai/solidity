// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Car {
    address public owner;
    string public model;
    address public carAddress;

    constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
        carAddress = address(this); // carAddress is the address of the contract
    }
}

contract CarFactory {
    Car[] public cars;

    function create(address _owner, string memory _model) public {
        Car car = new Car(_owner, _model);
        cars.push(car);
    }

    function createAndSendEther(
        address _owner,
        string memory _model
    ) public payable {
        Car car = (new Car){value: msg.value}(_owner, _model);
        cars.push(car);
    }

    function create2(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public {
        // _salt is a random number
        Car car = (new Car){salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function create2AndSendEther(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public payable {
        // _salt is a random number
        Car car = (new Car){value: msg.value, salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function getCar(
        uint _index
    )
        public
        view
        returns (
            address owner,
            string memory model,
            address carAddress,
            uint balance
        )
    {
        Car car = cars[_index];

        return (
            car.owner(),
            car.model(),
            car.carAddress(),
            address(car).balance
        );
    }
}
