// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract SimplateStorage {
    uint256 public storeData;

    constructor() {}

    // 设置存储值
    function set(uint256 x) public {
        storeData = x;
    }

    // 设置存储值
    function get() public view returns (uint256) {
        return storeData;
    }
}
