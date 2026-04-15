import hre from "hardhat";
import { expect } from "chai";
import { MyToken } from "../typechain-types";

describe("mytoken deploy", () => {
  let myTokenC: MyToken;
  before("should deploy", async () => {
    myTokenC = await hre.ethers.deployContract("MyToken", [
      "MyToken",
      "MT",
      18,
    ]);
  });
  it("shouild return name", async () => {
    expect(await myTokenC.name()).equal("MyToken");
  });
  it("shouild return symbol", async () => {
    expect(await myTokenC.symbol()).equal("MT");
  });
  it("shouild return decimals", async () => {
    expect(await myTokenC.decimals()).equal(18);
  });
  it("should retuen 0 totalSupply ", async () => {
    expect(await myTokenC.totalSupply()).equal(1);
  });
  it("should retuen 0 balance for signer 0 ", async () => {
    const signers = await hre.ethers.getSigners();
    expect(await myTokenC.balanceOf(signers[0].address)).equal(0);
  });
});
