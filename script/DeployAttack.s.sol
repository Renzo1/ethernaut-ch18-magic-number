// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "lib/forge-std/src/Script.sol";
import {Attack} from "../src/Attack.sol";

contract DeployAttack is Script {
    address magicNumAddr = 0xd59cF87982D1B83cD50d4dd7B8163BEd48F5b241;

    function run() external returns (Attack) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);
        Attack attack = new Attack(magicNumAddr);
        vm.stopBroadcast();

        return (attack);
    }
}

// forge script script/DeployAttack.s.sol:DeployAttack --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
