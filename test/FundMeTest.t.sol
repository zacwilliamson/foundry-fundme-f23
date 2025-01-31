// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        fundMe = new FundMe();
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5 * 10 ** 18);
    }

    function testOwnerIsMsgSender() public view {
        assertEq(fundMe.i_owner(), address(this));
    }

    function testPriceFeedVersionIsAccurate() public view {
        uint256 version = fundMe.getVersion();
        console.log(version);
        assertEq(version, 4);
    }
    // To test with on for with alchemy seoplia rpc
    // forge test --mt testPriceFeedVersionIsAccurate -vvvv --fork-url https://eth-sepolia.g.alchemy.com/v2/IAjtKZ13H-AyHifmaG_w0UgW3YR2RZBG
}

// forge coverage --fork-url https://eth-sepolia.g.alchemy.com/v2/IAjtKZ13H-AyHifmaG_w0UgW3YR2RZBG
