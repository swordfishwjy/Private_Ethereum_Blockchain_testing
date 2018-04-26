module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  // constracts_build_directory: "./output", // change the output directory for compiled contracts
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },

    live: {
      host: "127.0.0.1",
      port: 42024,
      network_id: "9111",
      gas: 7000000
    },

    eshlab: {
      host: "127.0.0.1",
      port: 42023,
      network_id: "9111",
      gas: 7000000
    },


    solc: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
};
