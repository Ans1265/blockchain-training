// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract CarRegistry is Ownable {
    struct Car {
        string model;
        uint256 year;
        address owner;
        uint256 chassisNumber;
    }

    mapping(uint256 => Car) public cars;

    function registerCar(uint256 chassisNumber, string memory model, uint256 year) public {
        require(cars[chassisNumber].owner == address(0), "Car already registered");
        cars[chassisNumber] = Car(model, year, msg.sender,chassisNumber);
    }

    function changeOwnership(uint256 chassisNumber, address newOwner) public onlyOwner {
        require(cars[chassisNumber].owner != address(0), "Car not registered");
        cars[chassisNumber].owner = newOwner;
    }

    function getCarDetails(uint256 chassisNumber) public view returns (Car memory) {
        require(cars[chassisNumber].owner != address(0), "Car not registered");
        return cars[chassisNumber];
    }

    function transferOwnership(uint256 chassisNumber, address newOwner) public {
        require(cars[chassisNumber].owner == msg.sender, "Not the owner of the car");
        cars[chassisNumber].owner = newOwner;
    }
}
