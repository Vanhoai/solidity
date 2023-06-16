const { expect } = require("chai");

describe("Token", function () {
  it("Should", async function () {
    // get owner address
    const [owner, address1, address2] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Token");

    const hardhatToken = await Token.deploy();

    await hardhatToken.transfer(address1.address, 50);
    expect(await hardhatToken.balanceOf(address1.address)).to.equal(50);

    // // transfer 50 tokens to address1
    await hardhatToken.connect(address1).transfer(address2.address, 50);
    const res = await hardhatToken.balanceOf(address2.address);
    console.log({ res });
    expect(await hardhatToken.balanceOf(address2.address)).to.equal(50);
  });
});
