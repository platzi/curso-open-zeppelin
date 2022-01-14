// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract MultiToken is ERC1155 {
    uint256 public constant Fungible = 0;
    uint256 public constant NoFungible = 1;
    uint256 public constant OtroFungible = 2;

    constructor() public ERC1155("aca una uri") {
        _mint(msg.sender, Fungible, 1000, "");
        _mint(msg.sender, NoFungible, 1, "");
        _mint(msg.sender, OtroFungible, 5000, "");
    }
}