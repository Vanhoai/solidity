// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryArray {
    function initial() public pure {
        uint256[] memory arrays = new uint256[](5);

        arrays[0] = 0;
        arrays[1] = 1;
        arrays[2] = 2;
        arrays[3] = 3;
        arrays[4] = 4;

        // read => arrays[0];
        // write => arrays[0] = 1;
        // delete => delete arrays[0];
    }
}
