pragma solidity ^0.4.8;


import 'zeppelin-solidity/contracts/token/MintableToken.sol';


contract ManuCoinV1 is MintableToken {

  string public constant name = "ManuCoin";
  string public constant symbol = "MANU";
  uint256 public constant decimals = 0;
  string public version = '0.1';

  uint256 public constant INITIAL_SUPPLY = 24 * 10**decimals;

  function ManuCoinV1() MintableToken() {
    mint(owner, INITIAL_SUPPLY);
  }

}
