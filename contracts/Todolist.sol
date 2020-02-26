pragma solidity ^0.5.0;

contract TodoList {
  uint public taskCount = 0;

   struct Task {
    uint id; //unique identifier for the struct  It will have an id, just like a traditional database record.
    string date;  //this is the text of the task in the todo list contained in a string.
    string coordinate;
    bool completed;  // this is the checkbox status of the todo list, which is true/false.
  }

  event TaskCreated(
    uint id,
    string date,
    string coordinate,
    bool completed
  );

  event LocationTaskCreated(
    uint id,
    bool completed

  );

    mapping(uint => Task) public tasks; //A mapping in Solidity is a lot like an associative array or a hash in other programming languages.

    function createTask(string memory date, string memory coordinate) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, date,coordinate, false);
    emit TaskCreated(taskCount, date, coordinate, false);

  }

  //1 First, we create the function with the function keyword, and give it a name createTask()
  constructor() public {
        createTask("date", '[ {"lat": 5.45678,"lng": 90.23456}]');

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