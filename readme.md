# Solidity Lottery
Created by Benjamin Mayer & Tristan Fink

With this smart contract  you can satify your gambling needs. You can buy one or multiple tickets to enter the pool and be eligible to be pulled as the winner.
Each ticket is worth 0.1 ETH and there is no max number of tickets which can be purchased. 

The contract is deployed on the Sepolia test network and is accessible under the following **address**: 0xFDeC47B667f4c3DdEab5F909b05cC778E7d3b1DC

## Getting Started
To test this contract, download the files and either add your config.json from an earlier project into the folder or change the config-dummy.json to include your infura api key and mnemoic seed for you metamask wallet.
Then connect to the sepolia network with the truffle cli using ```truffle console --network sepolia```
After connecting to the network fetch the deployed instance of the smart contract with ```let instance = await lottery.deployed()```

## Buying Tickets
To buy a ticket the *buyTickets()* function has to be used. The value has to be a multiple of 0.1 ETH (1 ticket costs 0.1 ETH), but it is possible to buy multiple tickets at once. The amount of tickets will be calculated automatically and will be added to the entry pool.
<sub><sub>When buying tickets 90% of the value will be added to the winnable pot, the other 10% will be transfered to the contract owner<sub><sub>

**Example using truffle:**
```instance.buyTickets({from: "YOU PUBLIC KEY" ,value: web3.utils.toWei("0.1")}) ```

## Show entry pool

The current entry pool can be displayed with the *showEntries()* function. It will display each ticket with the corresponding address which are currently in the pool.

**Example using truffle:**
```instance.showEntries() ```

## Picking the winner

The winner will be picked using the *pickWinner()* function which has to be triggered by the contract owner. This function picks a random ticket from the entry pool and sends the current contract balance to the winner.
