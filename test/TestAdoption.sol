pragma solidity ^0.4.11;

import 'truffle/Assert.sol';
// Assert checks for things like equality
// inequality or emptiness
import 'truffle/DeployedAddresses.sol';
// Deploys fresh instance of contract to be tested
// on test blockchain
import '../contracts/Adoption.sol';
// the contract we want to test

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // Tests adopt() function
  function testUserAdoptPet() {
    uint returnedId = adoption.adopt(8);
    uint expected = 8;

    Assert.equal(returnedId, expected, "Adoption of petID 8 should be recorded.");
  }
  // Tests retrieval of a single pet's owner
  function testGetAdopterAddressByPetId() {
    // expected owner is THIS contract
    address expected = this;
    address adopter = adoption.adopters(8);

    Assert.equal(adopter, expected, "Owner of petId 8 should be recorded");
  }
  // Tests retrieval of all pet owners
  function testGetAdopterAddressByArray() {
    // expected owner is this contract
    address expected = this;

    // store adopters in memory
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[8], expected, 'Owner of petId 8 should be recorded');
  }
}
