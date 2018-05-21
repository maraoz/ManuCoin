pragma solidity ^0.4.8;


import 'zeppelin-solidity/contracts/token/MintableToken.sol';


contract ManuCoin is MintableToken {

  string public constant name = "ManuCoin";
  string public constant symbol = "MANU";
  uint256 public constant decimals = 18;
  string public version = '1.0';

  uint256 public constant INITIAL_SUPPLY = 10 * 10**decimals;

  function ManuCoin() MintableToken() {
    mint(owner, INITIAL_SUPPLY);
  }

}
