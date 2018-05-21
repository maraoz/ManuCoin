pragma solidity ^0.4.8;


import 'zeppelin-solidity/contracts/token/MintableToken.sol';
import 'zeppelin-solidity/contracts/math/SafeMath.sol';


contract ManuCoinV2 is MintableToken {

  using SafeMath for uint256;

  string public constant name = "ManuCoin";
  string public constant symbol = "MANU";
  uint256 public constant decimals = 0;
  string public version = '0.2';

  uint256 public constant INITIAL_SUPPLY = 24 * 10**decimals;

  function ManuCoinV2() MintableToken() {
    mint(owner, INITIAL_SUPPLY);
  }

  // timelock functionality

  struct Timelock {
    uint256 value;
    uint64 releaseTime;
  }

  mapping (address => Timelock[]) public locks;

  function lock(address beneficiary, uint256 value, uint64 releaseTime) {
    require(releaseTime > now);

    uint256 count = locks[beneficiary].push(
        Timelock(
          value,
          releaseTime
        )
      );

    transfer(beneficiary, value);
  }

  // limit transfers

  function transfer(address _to, uint256 _value) canTransfer(msg.sender, _value) public returns (bool) {
    return super.transfer(_to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) canTransfer(_from, _value) public returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }

  modifier canTransfer(address _sender, uint256 _value) {
    require(_value <= transferableTokens(_sender, uint64(now)));
    _;
  }

  function transferableTokens(address holder, uint64 time) public constant returns (uint256) {

    uint256 locked = 0;
    for (uint256 i = 0; i < locks[holder].length; i++) {
      Timelock lock = locks[holder][i];
      if (time < lock.releaseTime) {
        locked = locked.add(lock.value);
      }
    }

    return balanceOf(holder).sub(locked);
  }


}
