/* Token ERC20 - Smart Contract  */
    
pragma solidity ^0.5.0;

contract ERC20Basic {

    string public name;
    string public symbol;
    uint8 public constant decimals = 0;  


    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
    event Transfer(address indexed from, address indexed to, uint256 tokens);


    mapping(address => uint256) _balances;

    mapping(address => mapping (address => uint256)) _allowed;
    
    uint256 totalSupply_;

    using SafeMath for uint256;


   constructor(uint256 total, string memory _name, string memory _symbol) public {  
	totalSupply_ = total;
	_balances[msg.sender] = totalSupply_;
	name = _name;
	symbol = _symbol;
    }  

    function totalSupply() public view returns (uint256) {
	    return totalSupply_;
    }
    
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function transfer(address receiver, uint256 numTokens) public returns (bool) {
        require(numTokens <= _balances[msg.sender]);
        _balances[msg.sender] = _balances[msg.sender].sub(numTokens);
        _balances[receiver] = _balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint256 numTokens) public returns (bool) {
        _allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public returns (bool) {
        require(numTokens <= _balances[owner]);    
        require(numTokens <= _allowed[owner][msg.sender]);
    
        _balances[owner] = _balances[owner].sub(numTokens);
        _allowed[owner][msg.sender] = _allowed[owner][msg.sender].sub(numTokens);
        _balances[buyer] = _balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}

library SafeMath { 
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a);
      return a - b;
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);
      return c;
    }
}