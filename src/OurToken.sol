// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 initSupply) ERC20("OurToken", "OT") {
        _mint(msg.sender, initSupply);
    }
}
