// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.21;

contract Bank {
    mapping(address => uint256) public balances;

    // 存钱函数
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // 取钱函数
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
    }

    // 获取余额函数
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}