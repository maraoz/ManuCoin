pragma solidity ^0.4.11;


import 'zeppelin-solidity/contracts/token/ERC20Basic.sol';


contract TokenTimelock {

  ERC20Basic token;

  address beneficiary;

  uint64 releaseTime;

  function TokenTimelock(ERC20Basic _token, address _beneficiary, uint64 _releaseTime) {
    require(_releaseTime > now);
    token = _token;
    beneficiary = _beneficiary;
    releaseTime = _releaseTime;
  }

  function release() {
    require(now >= releaseTime);

    uint256 amount = token.balanceOf(this);
    require(amount > 0);

    token.transfer(beneficiary, amount);
  }
}
