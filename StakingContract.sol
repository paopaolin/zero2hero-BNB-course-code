// https://github.com/owner/repo/blob/branch/path/to/Contract.sol

import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/security/ReentrancyGuard.sol";
import "./HodlerCoin.sol";
import "./MGLToken.sol";

contract StakeToEarn is ReentrancyGuard, Context {
    MGLToken stakingToken;
    HodlerCoin rewardsToken;

    uint256 constant RAY = 10**27;


    mapping(address => uint256) public userStakedAmount;
    mapping(address => uint256) public userRewardPerTokenIndex;
    mapping(address => uint256) public rewardsAccrued;

    uint256 public lastRewardPerTokenIndex;
    uint256 public lastUpdatedTimestamp;
    uint256 public rewardEverySecond;
    uint256 public totalStakedAmount;

    constructor(address stakingTokenAddr, address rewardsTokenAddr, uint _rewardEverySecond) {
        stakingToken = MGLToken(stakingTokenAddr);
        rewardsToken = HodlerCoin(rewardsTokenAddr);
        rewardEverySecond = _rewardEverySecond;
    }
