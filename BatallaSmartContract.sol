// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract studentInfo {

    
    function studentId(uint256 _idNumber) public payable {
        require(_idNumber == 93800, "Oops, wrong Id number.");
    }

    function gradeLevel(uint256 _level) public pure {
        if(_level != 3){
            revert("Oops, wrong year level.");
        }
    }

    function studentAge(uint256 _age) public payable  {
        assert(_age == 20);
    }


    
}
