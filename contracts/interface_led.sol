// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;


/**
 * @title IoT functions Interface 
 * @dev decleares all specified functions 
 */
interface led_interface {
    /**
     * @dev Store value in Blockchain 
     * @param newOn value set for the LED
     */
    function setLed(int8 newOn) external payable;

    /**
     * @dev Return value 
     * @return value of the LED 
     */
    function readLed() external view returns (int8);   

    /**
     * @dev only owner can execute
     */
    function retrieveEther() external;

    /**
     * @dev only owner can execute this
     */
    function kill() external;

}