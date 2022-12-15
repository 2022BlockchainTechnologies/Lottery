// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract lottery {
  address public owner = 0x19a2240BC18Eb298878E9922abCa00792825B859;
  address[] public players;

  function buyTickets() public payable{
    require(msg.value % 100000000000000000 == 0);
    uint entryCount = msg.value / 100000000000000000;
    while (entryCount > 0) {
      players.push(msg.sender);
      entryCount--;
    }
    
    payable (owner).transfer(msg.value/10);
  }

  function random() private view returns (uint) {
    return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
  }

  function pickWinner() public {
    require(msg.sender == owner);
    uint index = random() % players.length;
    payable (players[index]).transfer(address(this).balance);
    players = new address[](0);
  }

  function showEntries() public view returns (address[] memory){
    return players;
  }
}
