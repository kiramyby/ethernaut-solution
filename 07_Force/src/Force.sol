// SPDX-License-Identifier: NOLICENCE
pragma solidity ^0.8.0;

contract Force {
    fallback() external payable {
        revert();
    }
}
