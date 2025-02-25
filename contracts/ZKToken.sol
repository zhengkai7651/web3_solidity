// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.21;

// 引入ERC20合约
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

// 创建我的代币
contract ZKToken is ERC20 {
    // 代币名称
    string public constant NAME = "zhengERC20Token";
    // 代币缩写
    string public constant SYMBOL = "KZ";
    // 代币的初始数量
    uint256 public constant INITIAL_SUPPLY = 100000;

    // 初始化合约ERC20
    constructor() ERC20(NAME, SYMBOL) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
    // 设置小数位6
    function decimals() public view virtual override returns (uint8) {
        return 6;
    }
}