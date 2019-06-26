require('babel-register');
require('babel-polyfill');


const HDWalletProvider = require("truffle-hdwallet-provider-privkey");
const HDWalletProviderMem = require("truffle-hdwallet-provider");

const mnemonic = "runway hand direct evil panel unknown join spoil answer grass gaze sentence";

module.exports = {
    networks: {
        development: {
            host: "localhost",
            port: 9545,
            network_id: "*",
            // a lot of gas for testing
            gas: "7000000",
            gasPrice: "4000000000"
        },
        "ganache-cli": {
            host: "localhost",
            port: 8545,
            network_id: "*",
            gas: "6721975",
            gasPrice: "10000000"
        },
        "ganache-gui": {
            host: "localhost",
            port: 7545,
            network_id: "5777",
            gas: "6700000",
            gasPrice: "10000000"
        },
        "kovan": {
            provider: new HDWalletProviderMem(mnemonic, "wss://kovan.infura.io/ws/xeb916AFjrcttuQlezyq"),
            gas: "6238278",
            gasPrice: "8000000000",
            network_id: "*"
        }
    }
};
