// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract PrivacyTest is Script {
    bytes32 data =
        0xdc78d42a91aec8c83afda66e04efcd896a630103108c2463a3bc5d5b2f5187a3;
    bytes16 key;

    function run() public {
        key = bytes16(data);
        console.logBytes16(key);
    }
}
