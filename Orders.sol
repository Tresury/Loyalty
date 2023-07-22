// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Orders is Ownable {

        mapping(uint256 => address) public orders; //Number -> Address
        mapping(uint256 => uint256) public amounts; //NUmber -> Amounts
        mapping(uint256 => bool) public accepts;

        event NewOrder(uint256 number, uint256 amount, address user);
        event Acceptance(uint256 number);

        function addOrder(uint256 _number, uint256 _amount) public { // User добавляет заказ в систему
            orders[_number] = msg.sender;
            amounts[_number] = _amount;
            emit NewOrder(_number, _amount, msg.sender);
        }

        function accecpt(uint256 _number) public onlyOwner {
            accepts[_number] = true;
            emit Acceptance(_number);
        }
}
