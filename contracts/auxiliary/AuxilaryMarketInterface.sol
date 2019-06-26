pragma solidity ^0.5.0;

contract AuxilaryMarketInterface {

    function purchaseToken(uint256 _amount) public payable returns (uint256);
    function sellToken(uint256 _amount) public payable returns (uint256);
   // function priceOfToken() view public returns (uint256); 
}