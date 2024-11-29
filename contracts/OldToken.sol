//SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OldToken is ERC20{
    constructor() ERC20("OldToken","OLD"){
        _mint(msg.sender, 1000000 * 10 ** decimals()); //Initial Supply
    }
}