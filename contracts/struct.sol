//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Todos{
    struct Todo{
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public{
        todos.push(Todo(_text, false));

        todos.push(Todo({
            text: _text,
            completed: false
        }));

        Todo memory todo;
        todo.text = _text;

        todos.push(todo);

    }

    function updateText(uint i, string calldata _text) public{
        Todo storage todo = todos[i];
        todo.text = _text;
    }

    function get(uint i) public view returns (Todo) {
        Todo storage todo = todos[i];
        return todo;
    }

    function getTodoProps(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint i) public{
        Todo storage todo = todos[i];
        todo.completed = !todo.completed;
    }


}