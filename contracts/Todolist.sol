pragma solidity ^0.5.0;

contract TodoList {
  uint public taskCount = 0;

   struct Task {
    uint id; //unique identifier for the struct  It will have an id, just like a traditional database record.
    string content;  //this is the text of the task in the todo list contained in a string.
    bool completed;  // this is the checkbox status of the todo list, which is true/false.
  }
  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

    mapping(uint => Task) public tasks; //A mapping in Solidity is a lot like an associative array or a hash in other programming languages.

    function createTask(string memory _content) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);

  }

  //1 First, we create the function with the function keyword, and give it a name createTask()
  constructor() public {
        createTask("Check out dappuniversity.com");
  }
  

}