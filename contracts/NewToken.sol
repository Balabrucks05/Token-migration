//SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NewToken is ERC20, Ownable(msg.sender){
    constructor() ERC20("NewToken", "NEW"){}

    //Mint function restricted to only the owner
    function mint(address to, uint256 amount) external onlyOwner{
        _mint(to, amount);
    }

}
        

