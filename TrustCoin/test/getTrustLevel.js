var TrustCoin = artifacts.require("./TrustCoin.sol");

contract('TrustCoin', function(account) {

  it("should getTrustLevel correctly", function() {

    // Get initial balances of first and second account.
    var manager = account[0];
    // console.log(account_one);
    // console.log(web3.eth.getBalance(account_one));
    var device1 = account[1];
    var device2 = account[2];
    // console.log(account_two);

    var device1_trust;
    var device2_trust;

    var device1_level;
    var device2_level;
    // test trustLevel returned result
    var test1 = 1;
    var test2 = 2;

    return TrustCoin.deployed().then(function(instance) {
      trust = instance;
      return trust.sendCoin(device1, 5, {from: manager});
    }).then(function() {
      return trust.sendCoin(device2, 15, {from: manager})
    }).then(function(){
      return trust.getBalance.call(device1);
    }).then(function(balance) {
      device1_trust = balance.toNumber();
      console.log("Device1 balance now:" + device1_trust);
      return trust.getBalance.call(device2);
    }).then(function(balance) {
      device2_trust = balance.toNumber();
      console.log("Device2 balance now:" + device2_trust);
      return trust.getTrustLevel.call(device1);
    }).then(function(level) {
      device1_level = level.toNumber();
      assert.equal(device1_level, test1, "Trust level mapping wrong1");
      console.log("Device1 Trust level: " + device1_level);
      return trust.getTrustLevel.call(device2);
    }).then(function(level){
      device2_level = level.toNumber();
      assert.equal(device2_level, test2, "Trust level mapping wrong2");
      console.log("Device2 Trust level: " + device2_level);
    });
  });
});
