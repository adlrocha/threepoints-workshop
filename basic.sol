pragma solidity ^0.5.11;

contract SimpleSample {
    uint stateVar;

    function set(uint x) public {
        stateVar = x;
    }

    function get() public view returns (uint) {
        return stateVar;
    }
}
