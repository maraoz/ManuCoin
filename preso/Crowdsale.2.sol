
contract CrowdsaleWithCapAndFinalization is Ownable {

  function buyTokens(address beneficiary) public payable {
    uint256 tokens = msg.value.mul(rate);
    weiRaised = weiRaised.add(msg.value);

    require(weiRaised <= cap);

    token.mint(beneficiary, tokens);
    
  }

  function finalize() public onlyOwner {
    require(weiRaised == cap);
    token.mint(foundationAddress, FOUNDATION_ALLOCATION);
  }
}



