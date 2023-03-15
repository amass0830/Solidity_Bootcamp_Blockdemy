// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract coin_creation is ERC20 {
    constructor(uint256 _initialSupply) ERC20("Bimba_coin", "BMC") {
        _mint(msg.sender, _initialSupply * 10 ** 18);
        //lo multiplicamos por esto para que sea el equivalente en ether, no en wei que es 1/18 ether
    }
}
