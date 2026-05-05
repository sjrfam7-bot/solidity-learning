// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

abstract contract ManagedAccess {
    address public manager1;
    address public manager2;
    address public manager3;

    bool public confirmed1;
    bool public confirmed2;
    bool public confirmed3;

    constructor(address _manager1, address _manager2, address _manager3) {
        manager1 = _manager1;
        manager2 = _manager2;
        manager3 = _manager3;
    }

    modifier onlyAllConfirmed() {
        require(
            confirmed1 && confirmed2 && confirmed3,
            "Not all confirmed yet"
        );
        _;
    }

    modifier onlyManager() {
        require(
            msg.sender == manager1 ||
                msg.sender == manager2 ||
                msg.sender == manager3,
            "You are not a manager"
        );
        _;
    }

    function confirm() external onlyManager {
        if (msg.sender == manager1) confirmed1 = true;
        if (msg.sender == manager2) confirmed2 = true;
        if (msg.sender == manager3) confirmed3 = true;
    }
}
