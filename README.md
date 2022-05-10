# Basic-eth

To demonstrate how to deploy a basic contract to ethereum testnet.
Two deployment methods are demonstrated: script and `truffle console`.

## Prerequsites
The followings are required on then development machine:
- Nodejs
- Python
- [Ganache](https://trufflesuite.com/ganache/); local ethereum virtual machine (EVM)
- [Truffle](https://trufflesuite.com); development tool
- Register with [Infura](https://infura.io)
  - To connect to the ethereum or IPFS public network, you need to setup a self-hosted
    node for ethereum or IPFS, respectively; alternative use the cloud node provided by
    vendors like: infura, moralis, etc.
  - Infura provides access to the ethereum & IPFS public networks (testnet or mainnet)
    via https or websocket, and faster & scalable 

- Install `fs` and `HDWalletProvider`
```
npm init
npm install fs
npm install @truffle/hdwallet-provider
```


## References

- (1.) [Deploy your smart contracts to a public testnet; Mar 15, 2021](https://medium.com/nerd-for-tech/deploy-your-smart-contracts-to-a-public-testnet-7f9aef3f6039)
- (2.) [Deploying Solidity Contracts to testnet using Truffle - Beginners Tutorial; Jan 17, 2019](https://www.youtube.com/watch?v=XcFl8fj-_ZU)
- (3.) [Truffle Tutorial for Beginners - Deploy to Testnet & Mainnet (4/4)](https://www.youtube.com/watch?v=roHoOZXIxYs)
- (4.) [Deploying Contracts to Ropsten Testnet - Multi-Sig Wallet in Solidity (0.5)](https://www.youtube.com/watch?v=0j4Yp3coLuo&t=391s)

## Ethereum Public network details
### Networks
- mainnet
- testnet:
  - ropsten: id: 3; POW
  - rinkeby: id: 4; POA
  - kovan: id: 42; POA
  - binance??

### Faucets
Faucet is used to get `ether` for testnet environments.
Need to use the browser with wallet plugin.

- [testnet ropsten](https://faucet.egorfine.com/)
- [testnet rinkeby](https://faucet.rinkeby.io/)
- [testnet kovan]()

### Explorer
- [Etherscan mainnet](https://etherscan.io)
- [Etherscan testnet ropsten](https://ropsten.etherscan.io)
- [Etherscan testnet kovan](https://kovan.etherscan.io)


## Deploying to local EVM and testnet
Two deployment methods will be demonstrated: script and `truffle console`.

###  deploy using script to local EVM (ganache)
- ensure the contract has been compiled
- create deploy script in the `migrations` folder, let's say 
  `2_deploy_contracts.js`
- revised `truffle-config.js` to uncomment & configure `networks: {development: {}`
- ensure `ganache` is running 
- deploy the contract
```
truffle migrate 
```
- manual test using `truffle console`:
```
truffle console
truffle(development)> instance = await Purpose.deployed()
truffle(development)> instance
truffle(development)> instance.purpose.call()
truffle(development)> instance.setPurpose("hello")
```

##  deploy using script to testnet
- ensure the contract has been compiled
- create deploy script in the `migrations` folder, let's say 
  `2_deploy_contracts.js`
- revised `truffle-config.js` as follows:
  - uncomment wallet & configure:
  ```
  const HDWalletProvider = require('@truffle/hdwallet-provider');
  const fs = require('fs');
  const secrets = JSON.parse(fs.readFileSync(".secrets.json").toString().trim());
  ```
  - uncomment & configure `networks: {ropsten: {}}`
- create `.secret.json` file
  - mnemonic is that of the metamask wallet
  - metamask plugin to the firefox browser was used at the time of this development
  - to see the metamask mnemonic, go to: My Account > Settings > Security & Privacy >
    click Reveal Secret Recovery Phrase > (enter password)
- ensure `fs` and `HDWalletProvider` have been installed, otherwise:
```
npm install fs
npm install @truffle/hdwallet-provider
```
- Next, deploy; see "2022, May 06 deployment to ropsten"
```
truffle migrate --network ropsten
``` 
- References: (1.), (2.)

### 2022, May 06 deployment to ropsten
- Go to [Etherscan testnet ropsten](https://ropsten.etherscan.io)
- Search for 
  - transaction hash:    0xc22ef15085b7d72a6b4240950d6870794c5367305d33212a798684ba835391c6
- Deployment console output
```
MacBook-Pro:basic-eth gt$ truffle migrate --network ropsten

Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.


Starting migrations...
======================
> Network name:    'ropsten'
> Network id:      3
> Block gas limit: 8000000 (0x7a1200)


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0x372206153a644a79ab437ccd4709ed6ddc89ca1db8b7023340c1e9fdba1d7493
   > Blocks: 1            Seconds: 52
   > contract address:    0x0a7FBF4a782C47C87D05BEe0Dd04Cd19f662720D
   > block number:        12243305
   > block timestamp:     1651862894
   > account:             0x3D412Cc911A2209a4C39f1e66B46EECdE7cE3C64
   > balance:             11.299516892497101355
   > gas used:            193243 (0x2f2db)
   > gas price:           2.500000015 gwei
   > value sent:          0 ETH
   > total cost:          0.000483107502898645 ETH

   Pausing for 2 confirmations...

   -------------------------------
   > confirmation number: 1 (block: 12243306)
   > confirmation number: 2 (block: 12243307)
   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:     0.000483107502898645 ETH


2_deploy_contracts.js
=====================

   Deploying 'Purpose'
   -------------------
   > transaction hash:    0xc22ef15085b7d72a6b4240950d6870794c5367305d33212a798684ba835391c6
   > Blocks: 1            Seconds: 40
   > contract address:    0xbF7344dfA95eEf2427102BAfbe3FB107F6Ff18CB
   > block number:        12243309
   > block timestamp:     1651863046
   > account:             0x3D412Cc911A2209a4C39f1e66B46EECdE7cE3C64
   > balance:             11.298655539991588699
   > gas used:            298803 (0x48f33)
   > gas price:           2.500000016 gwei
   > value sent:          0 ETH
   > total cost:          0.000747007504780848 ETH

   Pausing for 2 confirmations...

   -------------------------------
   > confirmation number: 1 (block: 12243310)
   > confirmation number: 2 (block: 12243311)
   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:     0.000747007504780848 ETH

Summary
=======
> Total deployments:   2
> Final cost:          0.001230115007679493 ETH

MacBook-Pro:basic-eth gt$ 
```

- Manual test using truffle console
```
$truffle console
truffle(development)> instance = await Purpose.deployed()
truffle(development)> instance
truffle(development)> instance.purpose.call()
truffle(development)> instance.setPurpose("hello")
```


## deploy using truffle console
- In addition to the main "Prerequsites" above, there are prerequsites set in the
  "deploy using script to testnet" that are needed, in case they have not been setup:
  - ensure the contract has been compiled
  - revised `truffle-config.js` as follows:
    - uncomment wallet & configure:
  ```
  const HDWalletProvider = require('@truffle/hdwallet-provider');
  const fs = require('fs');
  const secrets = JSON.parse(fs.readFileSync(".secrets.json").toString().trim());
  ```
    - uncomment & configure  `networks: {ropsten: {}}`
  - create `.secret.json` file
    - mnemonic is that of the metamask wallet
    - metamask plugin to the firefox browser was used at the time of this development
    - to see the metamask mnemonic, go to: My Account > Settings > Security & Privacy >
      click Reveal Secret Recovery Phrase > (enter password)
  - ensure `fs` and `HDWalletProvider` have been installed

- NOTE: we have deployed to ropsten earlier using the script, see above
  - Otherwise, enter truffle console, and `migrate`; this is the same as `truffle migrate`
    and using the same `truffle-config.js` file.
  ```
  truffle console --network ropsten
  truffle(ropsten)> migrate
  ```

- Next, manually check the deployed contract
  - First check the connected wallet; the wallet is configured in the `truffle-config.js` file;
    using the mnemonic and the `HDWalletProvider`.
  - Note: this is the mnemonic copied from the metamask plugin to the firefox browser that 
    was used at the time of this development. There was one account created & shown in the
    metamask plugin at the time; additional accounts can be created.
  - the public key (address) of the account is '0x3D412Cc911A2209a4C39f1e66B46EECdE7cE3C64'.
  - To see the metamask mnemonic, go to: My Account > Settings > Security & Privacy >
    click Reveal Secret Recovery Phrase > (enter password). WARNING: keep secret!!!
  - Checking the wallet accounts. NOTE: the account shown on metamask plugin is the first
    account. **Question:** it seems that there are ten accounts automatically created for
    the wallet as shown below. Wondering if a new account is created in the metamask plugin
    that it will have the second public key (address)?? **to be investigated**
  ```
  truffle(ropsten)> await web3.eth.getAccounts()
  [
    '0x3D412Cc911A2209a4C39f1e66B46EECdE7cE3C64',
    '0xf37d8fB6144A91Fdf842b0383c3AbCDbdca91Af7',
    '0x70f29BB5745De2D5cA21c4af59d9CD4E860E3A8f',
    '0xA80f95442BEf083582142775b4B8665E49D4318C',
    '0x2269323ab1Af70E62Ec44d3a97395752648D05B9',
    '0xB9F2AcdE75C27492FcC927897b5B83D60A0B4bE5',
    '0xC7B72F7C43dDb91c163526134cD96EE3e6E19cD1',
    '0xDC33318e78AEe4347187eF47ee8c5598Ba80E862',
    '0xa95529b48b145f50E96c98f46f56380535DA7bad',
    '0x999E45727B0d4db2c9Ca21d5CaA53C93D05592DE'
  ]
  ```
  - Check balance for account 1:
  ```
  truffle(ropsten)> await web3.eth.getBalance("0x3D412Cc911A2209a4C39f1e66B46EECdE7cE3C64")
  '11298583944991101853'
  ```
  - Interact with the deployed contract
  ```
  truffle(ropsten)> let instance = await Purpose.deployed()
  undefined
  truffle(development)> instance.address
  '0xbF7344dfA95eEf2427102BAfbe3FB107F6Ff18CB'
  truffle(ropsten)> instance.purpose.call()
  'Basic Apps!!!'
  ```
  - Set the purpose; this transaction costs ether
  ```
  truffle(development)> instance.setPurpose("hello")
  {
    tx: '0xc7b2cde0dcf3361477f3d5d3e62da3bb3d73d1d68220301e39f12e2d96d93f9f',
    receipt: {
      blockHash: '0xf546d2e10876b225c8f70838b8f1d93d37d2a3234430b7fd90d2dcf9da1b4d8c',
      blockNumber: 12246726,
      contractAddress: null,
      cumulativeGasUsed: 536590,
      effectiveGasPrice: '0x9502f908',
      from: '0x3d412cc911a2209a4c39f1e66b46eecde7ce3c64',
      gasUsed: 75211,
      logs: [ [Object] ],
      logsBloom: '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000002080000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400',
      status: true,
      to: '0xbf7344dfa95eef2427102bafbe3fb107f6ff18cb',
      transactionHash: '0xc7b2cde0dcf3361477f3d5d3e62da3bb3d73d1d68220301e39f12e2d96d93f9f',
      transactionIndex: 6,
      type: '0x2',
      rawLogs: [ [Object] ]
    },
    logs: [
      {
        address: '0xbF7344dfA95eEf2427102BAfbe3FB107F6Ff18CB',
        blockHash: '0xf546d2e10876b225c8f70838b8f1d93d37d2a3234430b7fd90d2dcf9da1b4d8c',
        blockNumber: 12246726,
        logIndex: 9,
        removed: false,
        transactionHash: '0xc7b2cde0dcf3361477f3d5d3e62da3bb3d73d1d68220301e39f12e2d96d93f9f',
        transactionIndex: 6,
        id: 'log_0554be71',
        event: 'SetPurpose',
        args: [Result]
      }
    ]
  } 
  truffle(ropsten)> instance.purpose.call()
  'GT first contract on ethereum testnet'
  truffle(ropsten)> await web3.eth.getBalance("0x3D412Cc911A2209a4C39f1e66B46EECdE7cE3C64")
  '11298395917490500165'
  ```
- References: (1.), (2.), and (3.)

## MISC info, how-to for place holder for now

- [how-to] create private key for 
```
MacBook-Pro:basic-eth gt$ npx mnemonics
Need to install the following packages:
  mnemonics
Ok to proceed? (y) y
march kidney rough gauge remind bachelor soap satoshi cigar tired basket offer
```