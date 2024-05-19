# Hello World

This Solidity program is a simple smart contract program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. This program serves as a simple and straightforward introduction to Solidity programming, and can be used as a stepping stone for more complex projects in the future.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., SmartContract.sol). Copy and paste the following code into the file:

```javascript
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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile SmartContract.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "SmartContract" contract from the dropdown menu, and then click on the "Deploy" button.

Once the "deploy" button is clicked, a set of functions will appear at the bottom part. You can interact with it by depositing and withdrawing, and you can also check the remaining balances of the user.

## Authors

Kleyn

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
