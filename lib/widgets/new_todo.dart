import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController _inputField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(8),
        child: Card(
          child: TextField(
            controller: _inputField,
            decoration: InputDecoration(
              hintText: 'Enter your new Todo',
              icon: Icon(
                Icons.add,
                color: Colors.red,
              ),
              border: InputBorder.none,
            ),
          ),
        ));
  }
}
