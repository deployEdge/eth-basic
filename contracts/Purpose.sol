//SPDX-License-Identifier: MIT
//pragma solidity >=0.8.0 <0.9.0;
pragma solidity ^0.5.16;

contract Purpose {
    event SetPurpose(address sender, string purpose);

    string public purpose = "Basic Apps!!!";

    function setPurpose(string memory newPurpose) public {
        purpose = newPurpose;
        emit SetPurpose(msg.sender, purpose);
    }

}
