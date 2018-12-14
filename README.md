#### Distributed Operating Systems Principles - COP5615 Fall 2018####

##################################
Bitcoin Implementation Project 4.2
##################################

#################
  Group Members
#################
1) MRINALINI SINGH THAKUR (UFID: 9421-1951)    
2) SIDHARTH SHRIDHAR (UFID: 2818-3997)

####Instructions to run the program:####

To run the Phoenix server(Web UI):
1. Go the directory
  - cd proj4_pt2
2. Install Dependencies:
  - 'mix deps.get'
3. Install Node.js dependencies:
  - 'cd assets && npm install'
4. Run the Phoenix server (Go to the root directory 'cd ../')
  - 'mix phx.server'
5. Open the following link in the browser
  - 'http://localhost:4000/'  
6. Start stimulation by clicking the 'Start Simulation'
7. End the stimulation by clicking the 'Stop Simulation'  

####Some Test cases####

~To test the backend with available test cases, run(check for dependencies if upto date):
 - 'mix test'

#Test for Blockchains:
  test " new blockchain generation verification"
  ~ a new blockchain is generated and that blockchain is tested. A genesis block is generated and the blockchain is checked.
  test "transaction hash"
  ~ a simple test to check and verify the transaction hash values with the help of crypto functions and keys.

#Test for Mining:
  test " new blockchain generation verification"
  ~ a new blockchain is generated and that blockchain is tested. A genesis block is generated and the blockchain is checked.
  test "bitcoin transfer verification"
  ~ Unspent Transaction Outputs are verified after sending bitcoins from one to another.

#Test for Monitoring Part
  test "start peers"
  ~ a test whether the peers in the program have been invoked in the network by checking the registry count value.

#Test for network nodes
  test "exchange neighbors"  
  A contrast is made between the new state neighbors with original state neigbors. This performed by performing handle_cast operation between exchange and peer neighbors.
 
#Test for Network
  test "message saw?"
  ~ a record of messages for blocks and transactions broadcasted is tested. Checks for record of transaction if message existed is true and for block record if message not existed is false.
  

#Test for Wallet
  test "message seen"
  ~ a wallet balance and address is tested by associating with hash value. If balance & address matches test passes.

####Project implementation:####

#Metrics:-
Default no. of peers ~ 100 (value can be changed in 'const.ex' file)
Active traders ~ 75
Transaction rate ~ 2-5 secs

####Short summary####

Here p2p network bitcoin protocol is implemented with Elixir. The key features of Bitcoin like Wallets, Mining, Transactions have been implemented in this project for 100 participants. Web UI is implemented using the phoenix framework. Respective Controllers perform action by making GenServer call with necessary metrics values in order to generate and mine blocks and accordingly transaction is carried out. Simuation is shown on the web interface @localhost:4000. Mining rate graph shows real time stats for blocks mined. Also, stats such as no. of bitcoin mined in a session are also dynamic are shown in the web interface. Also, metrics such as active traders and peers vs miners count is also displayed.


