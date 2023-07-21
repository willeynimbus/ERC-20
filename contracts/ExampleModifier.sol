// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
import "./Owable.sol";

contract InheritenceModifierExample is Owner{
    mapping (address => uint) public tokenBalance;
    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[owner] = 100;
    }

    function createNewToken() public onlyOwner{
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner{
        tokenBalance[owner]--;
    }

    function purchaseToken() public payable {
        require((tokenBalance[owner]*tokenPrice)/msg.value> 0, "not enough token");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value/tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not emough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}