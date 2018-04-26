pragma solidity ^0.4.17;

library TrustMapping{

	function getLevel(uint trustBalance) public pure returns (uint trustLevel){
		if(trustBalance < 10){
      return 0;
    }
		else if(trustBalance >=10 && trustBalance<20){
			return 1;
		}
		else if(trustBalance >=20 && trustBalance<30){
			return 2;
		}
		else if(trustBalance >=30 && trustBalance<40){
			return 3;
		}
    else{
      return 4;
    }
	}

}
