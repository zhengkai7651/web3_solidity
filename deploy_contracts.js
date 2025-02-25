// const simpleStorage = artifacts.require("SimpleStorage");
// const myBallot = artifacts.require("my_ballot");

const zkToken = artifacts.require("ZKToken.sol");

module.exports = function (deployer) {
    deployer.deploy(zkToken);
};

// const pro = new Promise((resolve,rejcet) => {
//     const innerPro = new Promise((res,rejcet) => {
//         setTimeout(() => {
//             res(1)
//         });
//         console.log(2)
//         res(3)
//     })
//     resolve(4);
//     innerPro.then(res => console.log(res))
//     console.log("yideng")
// })
// pro.then(res => {console.log(res);})
// console.log('end')
// 2 yideng end 3 4

// Promise.resolve()
// .then(() => console.log(1))
// .then(() => console.log(2))
// .then(() => console.log(3))

// Promise.resolve()
// .then(() => console.log(4))
// .then(() => console.log(5))
// .then(() => console.log(6))

// setTimeout(() => {
//     console.log("111")
// })

// setInterval(() => {
//     console.log("2")
// })

// setImmediate(() => {
//     console.log("333")
// })