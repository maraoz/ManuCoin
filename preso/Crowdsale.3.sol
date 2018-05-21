
contract CrowdsaleWithCapAndFinalization {

  function buyTokens(address beneficiary) public payable {
    uint256 tokens = msg.value.mul(rate);
    weiRaised = weiRaised.add(msg.value);

    require(weiRaised <= cap);

    if (weiRaised == cap) {
      token.mint(foundationAddress, FOUNDATION_ALLOCATION);
    }

    token.mint(beneficiary, tokens);

  }
}


