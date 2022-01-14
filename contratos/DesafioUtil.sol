// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";

contract Validador {

    using ERC165Checker for address;

    function esERC20(address direccion) public view returns(bool) {
        bytes4 id = type(IERC20).interfaceId;
        return direccion.supportsInterface(id);
    }

    function esERC721(address direccion) public view returns(bool) {
        bytes4 id = type(IERC721).interfaceId;
        return direccion.supportsInterface(id);
    }

}