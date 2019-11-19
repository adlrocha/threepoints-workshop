pragma solidity ^0.5.10;

contract Gymkana {
    
    string public date;         // date 
    string public gymkana;      // gymkana
    string public secret;       // secret
    string public nextAsset;    // next asset 
    
    event Update(address from, string gymkana, string date);
    event Secret(address from, string secret, string nextAsset);

    constructor(string memory _secret, string memory _nextAsset) public{
        date = "29 de Octubre 2019";
        gymkana ="CasiWeekBlockchain";
        secret = _secret;
        nextAsset = _nextAsset;
        emit Update(msg.sender, _secret, _nextAsset);
    }
    
    function updateGymkana(string memory _date, string memory _gymkana) public returns (bool) {
        gymkana = _gymkana;
        date = _date;
        emit Update(msg.sender, _gymkana, _date);
        return true;
    }
    
    function setSecret(string memory _secret, string memory _nextAsset) public returns (bool) {
        secret = _secret;
        nextAsset = _nextAsset;
        emit Secret(msg.sender, _secret, _nextAsset);
        return true;
    }
    
}
