// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Telephone} from "../src/Telephone.sol";
import {TelephoneAttacker} from "../src/TelephoneAttacker.sol";

contract TelephoneAttackerTest is Test {
    Telephone target;
    address player = address(0x0000000000000000000000000000000000000001);

    function setUp() public {
        target = new Telephone();
    }

    function testAttack() public {
        TelephoneAttacker attacker = new TelephoneAttacker(address(target));
        vm.prank(player);
        attacker.attack();
        assertEq(target.owner(), player);
    }
}
