// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GcashPayment {
    address public accountUser;  // Setting 'accountUser' as the owner
    mapping(address => uint256) public userBalance;
    uint256 public constant maxBalance = 10000;

    constructor() {
        accountUser = msg.sender;  // Initializing 'accountUser' as the contract deployer
    }

    function deposit(uint256 _amount) public payable {
        require(_amount > 0, "Value must be greater than 0");  // Ensuring our deposit amount to be greater than 0
        require(userBalance[msg.sender] + _amount <= maxBalance, "Amount is bigger than the maximun balance");
        userBalance[msg.sender] += _amount;
        assert(userBalance[msg.sender] <= maxBalance); // Asserting the account balance after or if the deposited amount exceeds the maximum amount
    }

    function withdraw(uint256 _amount) public {
        require(_amount > 0, "Withdrawal amount should be greater than 0");  // Ensuring our withdrawal amount to be greater than 0
        require(userBalance[msg.sender] >= _amount, "You have insufficient balance");  // Checking if the sender has enough balance

        userBalance[msg.sender] -= _amount;  // Updating the balance mapping for the sender

        require(payable(msg.sender).send(_amount), "Withdrawal failed");
    }

    function checkBalance(address _accountUser) public view returns(uint256) {
        require(userBalance[_accountUser] > 0, "User has no Balance");
        return userBalance[_accountUser];
    }


}