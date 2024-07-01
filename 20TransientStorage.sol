// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Make sure EVM version and VM set to Cancun

// Storage - data is stored on the blockchain
// Memory - data is cleared out after a function call
// Transient storage - data is cleared out after a transaction


contract TestStorage {
    uint256 public val;

    function test() public {
        val = 123;
        bytes memory b = "";
        (bool success, ) = msg.sender.call(b);
        require(success, "Call failed");
    }
}

contract TestTransientStorage {
    uint256 SLOT = 0;

    function test() public {
        SLOT = 321;
        bytes memory b = "";
        (bool success, ) = msg.sender.call(b);
        require(success, "Call failed");
        SLOT = 0;
    }

    function val() public view returns (uint256 v) {
        return SLOT;
    }
}