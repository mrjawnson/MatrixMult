//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract MatrixMultDiverse {
    address public owner;
    event jeremy(string matrix);
    string public recentCalc;

    constructor(){
        owner = msg.sender;
    }

`   // Inspired by OraclizeAPI's implementation - MIT licence
    // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol
    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    function makeString3x3(uint[3][3] memory a) internal{
        string memory matrix = "";
        string memory temp;
        for(uint i; i < a.length; i++){
            for(uint j; j <  a[0].length; j++){
                if(i == 1  && j == 0|| i == 2 && j==0){
                    matrix = string(abi.encodePacked(matrix," | "));
                }
                string memory num = toString(a[i][j]);
                if(j != 2){
                    temp = string(abi.encodePacked(num,","));
                }else{
                    temp = num;
                }
                matrix = string(abi.encodePacked(matrix,temp));
            }
        }

        emit jeremy(matrix);
        recentCalc = matrix;
    }
    function makeString3x1(uint[3][1] memory a) internal{
        string memory matrix = "";
        string memory temp;
        for(uint i; i < a.length; i++){
            for(uint j; j <  a[0].length; j++){
                if(i == 1  && j == 0|| i == 2 && j==0){
                    matrix = string(abi.encodePacked(matrix," | "));
                }
                string memory num = toString(a[i][j]);
                if(j != 2){
                    temp = string(abi.encodePacked(num,","));
                }else{
                    temp = num;
                }
                matrix = string(abi.encodePacked(matrix,temp));
            }
        }

        emit jeremy(matrix);
        recentCalc = matrix;
    }
    function makeString2x2(uint[2][2] memory a) internal{
        string memory matrix = "";
        string memory temp;
        for(uint i; i < a.length; i++){
            for(uint j; j <  a[0].length; j++){
                if(i == 1  && j == 0|| i == 2 && j==0){
                    matrix = string(abi.encodePacked(matrix," | "));
                }
                string memory num = toString(a[i][j]);
                if(j != 2){
                    temp = string(abi.encodePacked(num,","));
                }else{
                    temp = num;
                }
                matrix = string(abi.encodePacked(matrix,temp));
            }
        }

        emit jeremy(matrix);
        recentCalc = matrix;
    }

    function matrixMult3x3(uint[3][3] memory a, uint[3][3] memory b) external returns (uint[3][3] memory product) {
        uint colsA = b[0].length;
        uint colsB = b[0].length; 

        uint rowsA = a.length; 

        for(uint i = 0; i < rowsA; ++i) {
            for(uint j = 0; j < colsB; ++j) {
                for(uint k = 0; k < colsA; ++k) {
                    product[i][j] += a[i][k] * b[k][j];
                }
            }
        }
        makeString3x3(product);
    }

    function matrixMult2x2(uint[2][2] memory a, uint[2][2] memory b) external returns (uint[2][2] memory product) {
        uint colsA = b[0].length;
        uint colsB = b[0].length; 

        uint rowsA = a.length; 

        for(uint i = 0; i < rowsA; ++i) {
            for(uint j = 0; j < colsB; ++j) {
                for(uint k = 0; k < colsA; ++k) {
                    product[i][j] += a[i][k] * b[k][j];
                }
            }
        }
        makeString2x2(product);
    }

    function matrixMult3x4X4x3(uint[3][4] memory a, uint[4][3] memory b) external returns (uint[3][3] memory product) {
        uint colsA = b[0].length;
        uint colsB = b[0].length; 

        uint rowsA = a.length; 

        for(uint i = 0; i < rowsA; ++i) {
            for(uint j = 0; j < colsB; ++j) {
                for(uint k = 0; k < colsA; ++k) {
                    product[i][j] += a[i][k] * b[k][j];
                }
            }
        }
        makeString3x3(product);
    }

    function matrixMult3x4X4x1(uint[3][4] memory a, uint[4][1] memory b) external returns (uint[3][1] memory product) {
        uint colsA = b[0].length;
        uint colsB = b[0].length; 

        uint rowsA = a.length; 

        for(uint i = 0; i < rowsA; ++i) {
            for(uint j = 0; j < colsB; ++j) {
                for(uint k = 0; k < colsA; ++k) {
                    product[i][j] += a[i][k] * b[k][j];
                }
            }
        }
        makeString3x1(product);
    }

}
