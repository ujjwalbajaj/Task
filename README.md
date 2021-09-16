# Task
Blockchain task


Task1:

Contarct A is implementing the task 1 :

function trimStringMirroringChars(string [] calldata data) public returns (string memory)

The logic is correct, only problem is as I delete the first index of array say e from electricity the whole array is deleted as the first index points the whole array
so, I tried shifting the elements and popping out the last one: eg: _electicityy and delete the last y nd the code is throwing error: string overflow, bignumber fault.
I tried rectifying but not solved.

Task2:
As delegate 1 and delegate 2 doesn't have tokens, and we only have tokens in master address. I tried delegating calls to master using proxy, but unable to transfer from delegate to master account address. 
