contract TokenTimelock {
  using SafeERC20 for ERC20Basic;
  ERC20Basic token;
  address beneficiary;
  uint256 releaseTime;

  function TokenTimelock(ERC20Basic _token,   
 address _beneficiary, uint256 _releaseTime) {
    require(_releaseTime > now);
    token = _token;
    beneficiary = _beneficiary;
    releaseTime = _releaseTime;
  }

  function release() {
    require(now >= releaseTime);
    uint256 amount = token.balanceOf(this);
    token.safeTransfer(beneficiary, amount);
  }
}



