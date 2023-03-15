// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./oraculo.sol";

contract ERC20_Oraculo is ERC20, Oraculo {
    //address owner;
    uint256 tokenPrice = 1 wei;

    constructor() ERC20("BlockdemyCoin", "USDT") {
        uint256 initialSupply = 1000;
        //owner = msg.sender;
        _mint(address(this), initialSupply);
    }

    function sellToken(
        address _to,
        uint256 _amount
    ) public payable returns (bool sucess) {
        uint256 tokenPriceTotal = (tokenPrice * getCost()) * _amount;
        require(
            msg.value >= (tokenPriceTotal),
            " No tienes fondos suficientes"
        );
        _transfer(address(this), _to, _amount);

        return true;
    }

    //Precio del ether en usd
    function getCost() public view returns (uint) {
        int price = getLatestPrice();

        return uint256(price);
    }
}
