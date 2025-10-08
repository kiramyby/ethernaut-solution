// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Solve} from "../src/Solve.sol";

contract SolveScript is Script {
    Solve public solve;

    function setUp() public {}

    function run() public {
        vm.createSelectFork("sepolia");
        vm.startBroadcast();
        solve = new Solve(0x328D2C0d36FbC142F6e0fBa0Bd1F76e7B775b70F);
        vm.stopBroadcast();
    }
}
