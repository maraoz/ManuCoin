
contract Rubixi {
    address private owner;
    function DynamicPyramid() { owner = msg.sender; }
    function collectAllFees() { owner.send(collectedFees); }
    ...
}


 
