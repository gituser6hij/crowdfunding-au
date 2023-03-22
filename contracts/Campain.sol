// Campaign contract
pragma solidity ^0.8.0;

contract Campaign {
    address public owner;      // The address of the owner of the campaign
    string public title;      // The title of the campaign
    uint public goal;         // The fundraising goal of the campaign (in wei)
    uint public raised;       // The total amount raised so far (in wei)
    uint public deadline;     // The deadline for the campaign (in UNIX timestamp)
    string public description;// A description of the campaign
    string public imageURL;   // The URL of the campaign image
    bool public isFinished;   // A flag indicating whether the campaign has ended
    
    mapping(address => uint) public contributions;  // A mapping of addresses to the amount contributed
    
    constructor(
        string memory _title, 
        uint _goal, 
        uint _durationInDays, 
        string memory _description,
        string memory _imageURL
    ) {
        owner = msg.sender;     // Set the owner to the address that created the contract
        title = _title;         // Set the title of the campaign
        goal = _goal;           // Set the fundraising goal of the campaign
        deadline = block.timestamp + (_durationInDays * 1 days); // Set the deadline for the campaign
        description = _description; // Set the description of the campaign
        imageURL = _imageURL;   // Set the URL of the campaign image
    }
    
    // Function for donating to the campaign
    function donate(string memory _message) public payable {
        require(block.timestamp < deadline, "Campaign has ended"); // Check that the campaign has not ended yet
        contributions[msg.sender] += msg.value; // Record the amount contributed by the sender
        raised += msg.value; // Increase the total amount raised
        emit DonationReceived(msg.sender, msg.value, _message); // Emit a donation event
    }
    
    // Function for withdrawing funds once the campaign has ended and the goal has been reached
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw funds"); // Check that the sender is the owner of the campaign
        require(block.timestamp >= deadline, "Campaign has not ended yet"); // Check that the campaign has ended
        require(raised >= goal, "Campaign goal was not reached"); // Check that the fundraising goal has been reached
        payable(owner).transfer(raised); // Transfer the funds to the owner
        isFinished = true; // Set the campaign as finished
        emit Withdrawal(owner, raised); // Emit a withdrawal event
    }
    
    // Function for checking whether the campaign is still active
    function checkIfActive() public view returns (bool) {
        if (block.timestamp >= deadline || raised >= goal) { // Check if the deadline has passed or the goal has been reached
            return false; // Return false if the campaign is not active
        }
        return true; // Return true if the campaign is still active
    }
    
    // Event for when a donation is received
    event DonationReceived(address indexed _donor, uint _value, string _message);
    
    // Event for when funds are withdrawn
    event Withdrawal(address indexed _owner, uint _value);
}
