pragma solidity ^0.4.8;


import 'zeppelin-solidity/contracts/token/MintableToken.sol';
import 'zeppelin-solidity/contracts/math/SafeMath.sol';


contract ManuCoinV3 is MintableToken {

  using SafeMath for uint256;

  string public constant name = "ManuCoin";
  string public constant symbol = "MANU";
  uint256 public constant decimals = 0;
  string public version = '0.3';

  uint256 public constant INITIAL_SUPPLY = 24 * 10**decimals;

  function ManuCoinV3() MintableToken() {
    mint(owner, INITIAL_SUPPLY);
  }

}
