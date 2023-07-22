// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SomeToken is ERC20 {
    constructor() ERC20("PizzaToken", "PZTK") {
        _mint(msg.sender, 10000000000);
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    event NewPurchase(uint256 order, uint256 item); 

    function buyItem(address to, uint256 amount, uint256 order, uint256 item) public returns(bool) {
        return super.transfer(to, amount);
        emit NewPurchase(order, item);
    }

}
