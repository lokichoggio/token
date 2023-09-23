// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {OurToken} from "../src/OurToken.sol";
import {Script, console} from "forge-std/Script.sol";

contract DeployOurToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether; // 1 million tokens with 18 decimal places
    uint256 public deployerKey;

    function run() external returns (OurToken) {
        if (block.chainid == 31337) {
            deployerKey = vm.envUint("ANVIL_PRIVATE_KEY");
        } else {
            deployerKey = vm.envUint("SEPOLIA_PRIVATE_KEY");
        }

        vm.startBroadcast(deployerKey);
        OurToken ourToken = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();

        return ourToken;
    }
}
