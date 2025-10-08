// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Solve} from "../src/Solve.sol";

contract SolverScript is Script {
    address solveContractAddress = 0xfe05244fB6a3b8e15AB1a1E7376776B44AD3F2a8;

    Solve solver = Solve(solveContractAddress);

    function run() external {
        vm.startBroadcast();
        solver.guessFlip();
        vm.stopBroadcast();
    }
}
