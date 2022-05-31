const hre = require("hardhat");

const PAIR_ADDRESS = "0x1A48E66C24DfFB01D39744c73A6d99B6910222C4";

async function main() {
  const signer0 = await ethers.provider.getSigner(1);
  const address1 = await signer0.getAddress();

  console.log(address1);

  const pair = await hre.ethers.getContractAt("IUniswapV2Pair",PAIR_ADDRESS);

  const totalSupply = await pair.totalSupply();

  const cABalance = await pair.balanceOf(address1);
  const {token1,token2,block} = await pair.getReserves();

console.log(ethers.utils.formatEther(block));
  /*console.log("TotalSupply: " + ethers.utils.formatEther(totalSupply) + 
              "| 0xcA1 Balance: " + ethers.utils.formatEther(cABalance) + 
              "Reserves: " + ethers.utils.formatEther(token1) + ", " 
              + ethers.utils.formatEther(token2));
*/
/*
  const matrixMult = await hre.ethers.getContractAt("MatrixMultDiverse","0x1718cf8F5cb05B0A7647104648574C8463fa50Ca",signer0);

  const a = [
    [1,2,3],
    [2,3,4],
    [1,2,3],
    [1,2,3]
  ];

  const b = [
    [1,2,3,4]
  ];

  

  const result = await matrixMult.matrixMult3x4X4x1(a,b);

  await result.wait();

  console.log(result);
*/
  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });