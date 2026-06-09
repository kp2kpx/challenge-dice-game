//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "../contracts/DiceGame.sol";
import "../contracts/RiggedRoll.sol";
import "./DeployHelpers.s.sol";

contract DeployDiceGame is ScaffoldETHDeploy {
    function run() external ScaffoldEthDeployerRunner {
        DiceGame diceGame = new DiceGame{ value: 0.05 ether }();
        console.logString(string.concat("DiceGame deployed at: ", vm.toString(address(diceGame))));

        RiggedRoll riggedRoll = new RiggedRoll(payable(address(diceGame)));
        console.logString(string.concat("RiggedRoll deployed at: ", vm.toString(address(riggedRoll))));

        riggedRoll.transferOwnership(0x970806327a3C4277A7E45403EC0B4B3d2BA18368);
    }
}
