const {ethers} = require("hardhat");

async function main(){
    const[deployer] = await ethers.getSigners();

    console.log("Deploying the contract with the account:", deployer.address);

    //Deploy the OldToken contract
    const OldToken = await ethers.getContractFactory("OldToken");
    const oldToken = await OldToken.deploy();
    console.log("OldToken deployed to:", oldToken.address);

    //Deploy the NewToken contract
    const NewToken = await ethers.getContractFactory("NewToken");
    const newToken = await NewToken.deploy();
    console.log("NewToken deployed to:", newToken.address)

    //Deploy the TokenMigration contract
    const TokenMigration = await ethers.getContractFactory("TokenMigration");
    const tokenMigration = await TokenMigration.deploy(oldToken.address, newToken.address);
    console.log("TokenMigration deployed to:", tokenMigration.address)

}
main().catch((error) =>{
    console.error(error);
    process.exitcode = 1;
})