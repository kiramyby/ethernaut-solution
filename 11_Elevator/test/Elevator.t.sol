// SPDX-Lience-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {Elevator} from "../src/Elevator.sol";
import {ElevatorAttacker} from "../src/ElevatorAttacker.sol";

contract ElevatorAttackerTest is Test {
    Elevator target;
    ElevatorAttacker attacker;

    function setUp() public {
        target = new Elevator();
        assertEq(target.top(), false);

        attacker = new ElevatorAttacker();
    }

    function testAttack() public {
        attacker.attack(address(target));
        assertEq(target.top(), true);
    }
}
