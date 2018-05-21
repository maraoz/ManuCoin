
contract ExampleCoin is MintableToken {
  ...
  function transferableTokens(address holder, uint64 time) ... {

    uint256 locked = 0;


    for (uint256 i = 0; i < locks[holder].length; i++) {
      Timelock lock = locks[holder][i];
      if (now < lock.releaseTime) {
        locked = locked.add(lock.value);
      }
    }

    return balanceOf(holder).sub(locked);
  }

}




