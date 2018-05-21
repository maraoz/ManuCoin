
import 'zeppelin-solidity/contracts/token/MintableToken.sol';


contract ExampleCoin is MintableToken {

  string public constant name = "ExampleCoin";
  string public constant symbol = "EGC";
  uint256 public constant decimals = 18;
  string public version = '0.1';

  uint256 public constant INITIAL_SUPPLY = 1000 * 10**decimals;

  function ExampleCoin() MintableToken() {
    mint(owner, INITIAL_SUPPLY);
  }

}





