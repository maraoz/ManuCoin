

contract ExampleCoin is MintableToken {

  string public constant name = "ExampleCoin";
  string public constant symbol = "EGC";
  uint256 public constant decimals = 18;
  string public version = '0.3';

  ...

  function ExampleCoin() MintableToken() {
    mint(owner, INITIAL_SUPPLY);
  }

}



