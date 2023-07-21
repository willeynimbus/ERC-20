// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Owner {
    address owner;
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Ypu are not allowed");
        _;
    }

}