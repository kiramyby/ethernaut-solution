// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {Force} from "../src/Force.sol";
import {ForceAttacker} from "../src/ForceAttacker.sol";

contract ForceAttackerTest is Test {
    Force target;
    ForceAttacker attacker;

    function setUp() public {
        target = new Force();
        attacker = new ForceAttacker();
        vm.deal(address(attacker), 1 wei);
    }

    function testAttack() public {
        assertEq(address(target).balance, 0);
        attacker.attack(payable(address(target)));
        assertEq(address(target).balance, 1 wei);
    }
}
