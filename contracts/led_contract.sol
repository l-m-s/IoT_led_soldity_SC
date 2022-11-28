// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./interface_led.sol";
/**
 * @title IoT-Smart Contract
 * @dev Interact with Smart Contract
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract led_contract is led_interface {

    address payable private owner;
    int8 public ledStatus;
    address public contractAddress;

    constructor(){
        owner = payable(msg.sender);
        contractAddress = address(this);
    }

    /**
     * @dev Store value in Blockchain
     * @param newOn 1 - toturn led on  0 - turn led off  
     */
    function setLed(int8 newOn) public override payable {
        require( newOn == 1 || newOn ==0, "only 0 or 1 as parameter for the setLed function");
        ledStatus = newOn;
        //owner.transfer(msg.value);
        owner.transfer(msg.value);
    }

    function getCurrentAddress() public view returns (address payable){
          return payable(address(this));
    }

    /**
     * @dev Return value 
     * @return 'ledStatus' status of the led 1 is on 0 is off
     */
    function readLed() public view override returns (int8){
        return ledStatus;
    }

    /**
     * @dev Returns the ether value 
     */
    function retrieveEther() public override onlyOwner{

    }

    
    /**
     * @dev to kill the contract from the blockchain
     */
    function kill() public override onlyOwner{
        selfdestruct(owner);
    }

    function getOwner() public view returns (address) {
        return owner;
    }


    function getBalanceOwner() public view returns(uint){
        return owner.balance;
    }
    /**
     * @dev makes sure only the owner can execute it
     */
    modifier onlyOwner {
        require(msg.sender == owner, "checks for owner of contract");
        _;
    }

    /**
     * @dev transfers the ownership of the contract 
     */
    function transferOwnerShip(address payable _newOwner) public onlyOwner{
        owner = _newOwner;
    }
}