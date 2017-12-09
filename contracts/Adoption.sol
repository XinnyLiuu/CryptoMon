// for complier to know which version of sol to use
pragma solidity ^0.4.4;

contract Adoption {
  // adopters is an array with len 16
  address[16] public adopters;

  // adopting a pet
  function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 15);
    // makes sure petId is within index range of adopters array
    adopters[petId] = msg.sender;
    // add address of msg.sender to adopters array
    return petId;
  }

  // retrieving the adopters
    // the adopt function only returns one value
  function getAdopters() public returns (address[16]) {
    return adopters;
  }

}
