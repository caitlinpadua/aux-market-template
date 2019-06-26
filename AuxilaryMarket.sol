pragma solidity ^0.5.0;

import "../../lib/lifecycle/Destructible.sol";
import "../../lib/ownership/Upgradable.sol";
import "./AuxilaryMarketInterface.sol";
import "../../platform/dispatch/Dispatch.sol";

contract AuxilaryMarket is Destructible, AuxilaryMarketInterface, Upgradable {

    //events to be emitted when purchasing or selling token
    event TokenPurchased(address _owner, uint256 amountPurchased);
    event TokenSold(address _owner, uint256 amountSold);

    address public owner;
    uint256 sellFee;
    uint256 currentPrice;

    //mapping for balances of the user
    mapping (address => uint256) balanceOfUser;
    Dispatch public sendq;

    constructor() public {
        owner = msg.sender;
    }

    function purchaseToken(uint256 _amount) public payable returns (uint256){
        require(_amount <= balanceOfUser[msg.sender]);
        balanceOfUser[msg.sender] -= _amount;
        emit TokenPurchased(msg.sender, _amount);
        return balanceOfUser[msg.sender];
    }

    function sellToken(uint256 _amount) public payable returns (uint256) {
        require(_amount <= balanceOfUser[msg.sender]);
        sellFee = (_amount * 50) / 1000;
        balanceOfUser[msg.sender] = balanceOfUser[msg.sender] + _amount - sellFee;
        emit TokenSold(msg.sender, _amount);
        return balanceOfUser[msg.sender];
    }

    // function to query an oracle to determine price of the token
    // function priceOfToken() view public returns(uint256) {
    //     uint256 id;
    //     address provider = 
    //     string memory userQuery = 
    //     bytes32 endpoint = 
    //     bytes32[] memory endpointParams = 
    //     currentPrice = sendq.query(provider, userQuery, endpoint, endpointParams);
    //     return currentPrice;
    // }

}