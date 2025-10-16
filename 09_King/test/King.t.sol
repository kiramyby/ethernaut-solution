// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {King} from "../src/King.sol";
import {KingAttacker} from "../src/KingAttacker.sol";

contract KingAttackerTest is Test {
    King target;
    KingAttacker attacker;
    address victim = makeAddr("victim");

    function setUp() public {
        vm.deal(victim, 2 ether);
        vm.prank(victim);
        target = new King{value: 0.001 ether}();
        assertEq(target._king(), victim);

        attacker = new KingAttacker();
        vm.deal(address(attacker), 1 ether);
    }

    function testAttack() public {
        attacker.attack(payable(address(target)));
        assertEq(target._king(), address(attacker));

        vm.prank(victim);
        vm.expectRevert("Long live the king!");
        (bool success, ) = address(target).call{value: 1 ether}("");
        require(success, "Claim failed.");
    }
}
