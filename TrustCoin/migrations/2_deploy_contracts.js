var TrustMapping = artifacts.require("./TrustMapping.sol");
var TrustCoin = artifacts.require("./TrustCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(TrustMapping);
  deployer.link(TrustMapping, TrustCoin);
  deployer.deploy(TrustCoin);
};
