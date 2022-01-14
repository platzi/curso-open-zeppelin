// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract ContratoConRoles is AccessControl {

    bytes32 public constant ROL_ADMIN = keccak256("ROL_ADMIN");
    bytes32 public constant ROL_USUARIO = keccak256("ROL_USUARIO");

    constructor() {
        _grantRole(ROL_ADMIN, msg.sender);
    }

    function soloAdmin() public  {
        require(hasRole(ROL_ADMIN, msg.sender), "Esta funcion solo puede ser utilizada por el ADMIN");
    }

    function soloUsuario() public  {
        require(hasRole(ROL_USUARIO, msg.sender), "Esta funcion solo puede ser utilizada por un USUARIO");
    }

    function agregarRol(bytes32 role, address account) public {
        require(hasRole(ROL_ADMIN, msg.sender), "Esta funcion solo puede ser utilizada por el ADMIN");

        _grantRole(role,account);
    }

}