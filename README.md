# web3_solidity
web3 solidity study

## 安装合约依赖包 以及 truffle工具库
yarn 

## truffle 工具编译合约
编译合约
truffle compile

部署合约
truffle migrate

运行测试
truffle test

开发控制台
truffle console

编译指定的合约
truffle compile --contracts_directory ./contracts

测试指定的合约和测试文件
truffle test ./test/MyContract.test.js

部署到特定的网络：
truffle migrate --network <network-address>

显示版本信息
truffle version

帮助命令
truffle help