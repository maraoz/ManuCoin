var ManuCoin = artifacts.require("./ManuCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(ManuCoin);
};
