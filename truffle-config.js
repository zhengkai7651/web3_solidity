module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },
    loc_truffledemo_truffledemo: {
      network_id: "*",
      port: 8548,
      host: "127.0.0.1"
    }
  },
  mocha: {},
  compilers: {
    solc: {
      version: "0.8.21",
      settings: {
        // See the solidity docs for advice about optimization and evmVersion
        optimizer: {
          enabled: false,
          runs: 300,
        },
        evmVersion: 'byzantium',
      },
    }
  },
   
};
