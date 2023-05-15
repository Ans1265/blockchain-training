// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Todos {
    string[] public todos;
    
    function setTodo(string memory _todo) public {
        require(bytes(_todo).length > 0, "Todo cannot be empty.");
        todos.push(_todo);
    }
    
    function getTodo() public view returns (string[] memory) {
        return todos;
    }
    
    function getTodosLength() public view returns (uint) {
        return todos.length;
    }
    
    function deleteToDo(uint _index) public {
        require(_index < todos.length, "This todo index does not exist.");
        todos[_index] = todos[todos.length - 1];
        todos.pop();
    }
}
