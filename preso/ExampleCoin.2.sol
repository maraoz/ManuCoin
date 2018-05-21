
contract ExampleCoin is MintableToken {
  ...
  string public version = '0.2';
  mapping (address => Timelock[]) public locks;

  function lock(address beneficiary, uint value, uint releaseTime) {
    require(releaseTime > now);

    transfer(beneficiary, value);

    locks[beneficiary].push(Timelock(value, releaseTime));
  }

  ...
}




