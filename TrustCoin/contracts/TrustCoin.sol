pragma solidity ^0.4.17;

import "./TrustMapping.sol";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract TrustCoin {
	mapping (address => uint) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function TrustCoin() public {
		balances[tx.origin] = 99999;
	}

	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		/* Transfer(msg.sender, receiver, amount); */
		return true;
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}

  function getTrustLevel(address account) public view returns(uint) {
    return TrustMapping.getLevel(getBalance(account));
  }
}
