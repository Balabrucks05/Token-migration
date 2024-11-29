//SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import "./OldToken.sol"; // Import the oldToken contract
import "./NewToken.sol"; // Import the newToken contract

contract TokenMigration{
    OldToken public oldToken;
    NewToken public newToken;

    constructor(address _oldToken, address _newToken){
        oldToken = OldToken(_oldToken);
        newToken = NewToken(_newToken);
    }

    //Token migratin function
    function migrate(uint256 amount) external{
        require(oldToken.balanceOf(msg.sender) >= amount, "Not enough old tokens"); // Ensure the sender has enough old tokens
        oldToken.transferFrom(msg.sender, address(this), amount); //Transfer old tokens to the migration contract
        // newToken.mint(msg.sender, amount); //Mint equivalent new tokens
    }
}