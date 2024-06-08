// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MEGA is ERC20, Ownable {
    constructor(address _owner)
        ERC20("Make England Great Again", "MEGA")
        Ownable(_owner) {
        _mint(_owner, 1000000000 * 10 ** decimals()); // Mint initial supply of 1 billion tokens
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(balanceOf(msg.sender) >= amount, "ERC20: transfer amount exceeds balance");
        super._transfer(msg.sender, recipient, amount); // Transfer the amount to the recipient
        return true;
    }

    // Fallback and receive functions simplified to single-line reverts
    fallback() external {
        revert("Fallback not allowed");
    }

    receive() external payable {
        revert("Direct ETH not accepted");
    }
}
