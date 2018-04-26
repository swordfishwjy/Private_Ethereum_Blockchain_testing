var TrustCoin = artifacts.require("./TrustCoin.sol");
var contractAddress = "0x4379d218b0aef0730c3dc25787a21c6d440f7db7";

module.exports = function(callback){
  var toAddr = "0x9e719ff812e7129d89bd6c62c2a3782be3bf8cf7";
  // var amount = process.argv[5];
  var amount = 5;
  if(toAddr == undefined){
    callback("Provide an address to sent to");
  }
  if(amount == undefined || amount < 0){
    callback("Provide a amount");
  }
  var instance = TrustCoin.at(contractAddress);
  var tranx = instance.sendCoin(toAddr,amount);
  tranx.then(function(result){
    console.log(amount, "TrustCoin sent to: ", toAddr);
    // callback("sendCoin succeeded")
  }).catch(function(error) {
    console.log(error);
    callback("sendCoin failed");
  })

  var balance = instance.getBalance.call(toAddr);
  balance.then(function (result) {
    console.log("<0x9e719ff812e7129d89bd6c62c2a3782be3bf8cf7 has coins>: ", result);
  }).catch(function(error){
    console.log(error);
    callback("getBalance failed");
  })
}
