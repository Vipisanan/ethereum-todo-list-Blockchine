pragma solidity ^0.5.0;

contract TodoList {
  uint public taskCount = 0;

struct Coordinate {
    string lat;
    string lng;
  }
   struct Task {
    uint id; //unique identifier for the struct  It will have an id, just like a traditional database record.
    string lat;  //this is the text of the task in the todo list contained in a string.
    string lng;
    bool completed;  // this is the checkbox status of the todo list, which is true/false.
  }

  
  event TaskCreated(
    uint id,
    string lat,
    string lng,
    bool completed
  );

    mapping(uint => Task) public tasks; //A mapping in Solidity is a lot like an associative array or a hash in other programming languages.

    function createTask(string memory lat, string memory lng) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, lat,lng, false);
    emit TaskCreated(taskCount, lat,lng, false);

  }

  //1 First, we create the function with the function keyword, and give it a name createTask()
  constructor() public {
        createTask("23.3456", "23.345678");
        createTask("23.234568", "23.7654");

  }
  
  event TaskCompleted(
    uint id,
    bool completed
  );

  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }

}