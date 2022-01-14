// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract ControlAcceso is AccessControl {

    bytes32 rolAdmin = keccak256("ROL_ADMIN");
    bytes32 rolWriter = keccak256("ROL_WRITER");

    constructor() {
        _grantRole(rolAdmin, msg.sender);
    }

    uint256 number;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public onlyWriter {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }

    modifier onlyWriter() {
        require(hasRole(rolWriter, msg.sender), "Solo pueden ejecutar la funcion los roles Writer");
        _;
    }

    modifier onlyAdmin() {
        require(hasRole(rolAdmin, msg.sender), "Solo pueden ejecutar la funcion los roles Admin");
        _;
    }

    function agregarWriter(address cuenta) public onlyAdmin {
        _grantRole(rolWriter, cuenta);
    }

    function quitarWriter(address cuenta) public onlyAdmin {
        _revokeRole(rolWriter, cuenta);
    }


}
