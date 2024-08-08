// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ProgrammableDefensiveTokenTransfers} from "../src/ProgrammableDefensiveTokenTransfers.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract ProgrammableDefensiveTokenTransfersScript is Script {
    ProgrammableDefensiveTokenTransfers public programmableDefensiveTokenTransfers;

    function setUp() public {}

    function run() public {
        HelperConfig helperConfig = new HelperConfig();
        (address router, address link) = helperConfig.activeNetworkConfig();

        vm.startBroadcast();

        programmableDefensiveTokenTransfers = new ProgrammableDefensiveTokenTransfers(router, link);

        vm.stopBroadcast();
    }
}
