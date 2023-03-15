//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract CuentaAhorros {
    uint public balance;
    address public owner;

    constructor() {
        owner = msg.sender;
        balance = 100;
    }

    function depositar() public payable {
        require(msg.value > 0, "Tiene que ser mayor a 0");
        balance += msg.value;
    }

    function retirar(address payable recipient, uint amount) public {
        require(amount > 0, "Tiene que ser mayor a 0");
        require(amount <= balance, "Saldo insuficiente");
        balance -= amount;
        recipient.transfer(amount);
    }

    function getBalance() public view returns (uint) {
        return balance;
    }
}
