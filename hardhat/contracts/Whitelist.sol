//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
/* 
    Whiteslists first 'x' addresses
    constrcutor takes x during deployment
 */
contract WhiteList {
    uint8 public maxWhitelistedAddresses;
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }
    uint8 public numAddressesWhitelisted;
    mapping (address => bool) public whitelistedAddresses ;

    function  addAddresstoWhitelist() public  {
         // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");

        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted+=1;
    }
    /* 
        Thus this contract's ABI exposes :
        1. maxWhitelistedAddrsses
        2. numAddressesWhitelisted
        3. whitelistedAddresses
        4. addAddresstoWhitelst -> fn
     */
    
}