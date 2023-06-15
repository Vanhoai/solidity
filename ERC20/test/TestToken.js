const { expect } = require("chai");

describe("Token", function () {
  it("Should", async function () {
    // get owner address
    const [owner, address1, address2] = await ethers.getSigners();

    const lock = await ethers.deployContract("Token");

    const ownerBalance = await lock.balanceOf(owner.address);
    expect(await lock.balanceOf(owner.address)).to.equal(ownerBalance);

    // transfer 50 tokens to address1
    await lock.connect(address1).transfer(address2.address, 50);
    expect(await lock.balanceOf(address2.address)).to.equal(50);
  });
});
