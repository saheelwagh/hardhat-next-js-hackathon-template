const { ethers } = require("hardhat");

async function main() {
  /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistContract here is a factory for instances of our Whitelist contract.
  */
  const whitelistContract = await ethers.getContractFactory("Whitelist"); //replace with your contract's name

  // here we deploy the contract
  const deployedWhitelistContract = await whitelistContract.deploy(10);
  // 10 is the Maximum number of whitelisted addresses allowed
  // use your constructor's options accordingly

  // Wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  // print the address of the deployed contract
  // your frontend app will require this
  console.log("Whitelist Contract Address:", deployedWhitelistContract.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });