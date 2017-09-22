'use strict';

const BigNumber = web3.BigNumber

const should = require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should()

import latestTime from './helpers/latestTime.js';
import moment from 'moment'


var ManuCoin = artifacts.require('../contracts/ManuCoin.sol');

contract('ManuCoin', function([_, owner, beneficiary]) {
  let token;

  beforeEach(async function() {
    token = await ManuCoin.new({from: owner});
  });

  it('owner should have initial supply', async function() {
    const initialSupply = await token.INITIAL_SUPPLY();
    const ownerBal = await token.balanceOf(owner);
    const totalSupply = await token.totalSupply();
    totalSupply.should.be.bignumber.equal(ownerBal);
    totalSupply.should.be.bignumber.equal(initialSupply);
  });

  it('can send locked tokens', async function() {
    const ownerBal = await token.balanceOf(owner);
    const now = latestTime();
    const tomorrow = now + 1000;
    const value = ownerBal.div(2);
    await token.lock(beneficiary, value, tomorrow);
  });

});
