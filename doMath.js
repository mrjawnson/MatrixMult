const hre = require("hardhat");

async function main() {
  //get a signer
  const signer0 = await ethers.provider.getSigner(1);
  const address1 = await signer0.getAddress();
  
  //print address to verify
  console.log(address1);
  
  //get the contract
  const matrixMult = await hre.ethers.getContractAt("MatrixMultDiverse","0x1718cf8F5cb05B0A7647104648574C8463fa50Ca",signer0);

  //make some matrices
  const a = [
    [1,2,3],
    [2,3,4],
    [1,2,3],
    [1,2,3]
  ];

  const b = [
    [1,2,3,4]
  ];

  
//get the result
  const result = await matrixMult.matrixMult3x4X4x1(a,b);
  await result.wait();

  console.log(result);
  
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
