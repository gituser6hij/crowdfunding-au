Crowdfunding Contract
This is a smart contract written in Solidity that enables users to create crowdfunding campaigns for a specific purpose. The contract allows anyone to contribute funds to a campaign and tracks the amount raised against the target goal set by the campaign creator. Once the campaign has ended, the funds can be withdrawn by the campaign creator only if the target goal has been reached.

Key Features
The key features of the contract include:

Campaign Creation: Users can create a new campaign by providing a title, a target fundraising goal, a duration in days, a description, and an optional image URL.

Campaign Donation: Users can donate to a campaign by sending funds to the contract address along with a message (limited to 99 characters). The contract will track the amount donated by each user and add it to the total amount raised.

Campaign Withdrawal: Once the campaign has ended, the campaign creator can withdraw the funds raised by the campaign if the target fundraising goal has been reached. If the goal has not been reached, the funds will remain in the contract until the creator manually withdraws them.

Campaign Completion: The contract checks if the campaign has ended by comparing the current block timestamp to the campaign's deadline. If the deadline has passed or the fundraising goal has been met, the campaign is considered complete and no further donations can be made.

Contract Details
The contract is written in Solidity and deployed on the Ethereum network. It includes the following variables:

owner: The address of the campaign creator (i.e., the contract owner).
title: The title of the campaign.
goal: The target fundraising goal.
raised: The total amount raised by the campaign so far.
deadline: The deadline for the campaign (i.e., the number of days after which the campaign ends).
description: The description of the campaign.
imageURL: The URL of the campaign image (optional).
isFinished: A boolean value that indicates whether the campaign has ended or not.
The contract also includes the following functions:

donate(string memory _message) public payable: Allows users to donate to the campaign by sending funds to the contract address along with a message (limited to 99 characters).
withdraw() public: Allows the campaign creator to withdraw the funds raised by the campaign if the target fundraising goal has been reached.
checkIfActive() public view returns (bool): Checks if the campaign is still active or if it has ended.
The contract also includes two events:

DonationReceived(address indexed _donor, uint _value, string _message): Fired whenever a donation is made to the campaign, includes the donor's address, the value donated, and the donor's message.
Withdrawal(address indexed _owner, uint _value): Fired when the campaign creator withdraws the funds raised by the campaign, includes the campaign creator's address and the value withdrawn.
Conclusion
This crowdfunding contract provides a simple and secure way for users to create and manage crowdfunding campaigns on the Ethereum network. With the ability to track donations, set fundraising goals, and withdraw funds once a campaign is complete, this contract can be a valuable tool for anyone looking to raise funds for a specific purpose.