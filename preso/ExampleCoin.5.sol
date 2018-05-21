
contract ExampleCoin is MintableToken {
  ...
  uint public MAX_LOCKS = 10;

  function lock(address beneficiary, uint value, uint releaseTime) {
    require(releaseTime > now);

    uint256 count = locks[beneficiary].push(
               Timelock(value, releaseTime));

    require(count < MAX_LOCKS);

    transfer(beneficiary, value);
  }

  ...
}



