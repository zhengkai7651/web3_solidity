// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.21;

// 创建我的代币合约规则
contract ZKCoinMoney {
 
    // 定义一个映射，用于存储每个地址的余额
    address public minter; 
    // 定义一个事件，用于记录转账操作
    mapping(address => uint256) public balances;

    // 定义一个事件，用于记录转账操作 账户更新
    event Sent(address from, address to, uint256 amount);

    // 构造函数，用于初始化合约
    constructor(){
        // 获取调用合约的用户地址
        minter = msg.sender;
    }

    // 转账函数，用于将余额从一个地址转移到另一个地址
    function send(address receiver, uint256 amount) public {
        // 检查调用合约的用户地址是否为合约创建者
        require(msg.sender == minter, "Sender is not minter");  
        // 检查调用合约的用户地址的余额是否足够
        require(balances[msg.sender] >= amount, "Not enough ether");
        // 检查接收地址是否为合约地址
        require(receiver != address(0), "Cannot send to zero address");
        
        // 执行转账操作;
        balances[msg.sender] -= amount; // 
        balances[receiver] += amount;
    }

    // 获取余额函数，用于获取指定地址的余额
    function getBalance(address account) public view returns (uint256) {
        // 返回指定地址的余额
        return balances[account];
    }

    // 存钱函数，用于将余额存入合约
    function mint(address receiver, uint256 amount) public {
        // 检查调用合约的用户地址是否为合约创建者
        require(msg.sender == minter, "Sender is not minter");
        // 执行存钱操作
        balances[receiver] += amount;
    }

    // 获取合约创建者地址函数，用于获取合约创建者的地址
    function getMinter() public view returns (address) {
        // 返回合约创建者的地址
        return minter;
    }
    
}