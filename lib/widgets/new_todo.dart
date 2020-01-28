import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  final Function handleSubmit;
  NewTodo(this.handleSubmit);
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController _inputField = TextEditingController();
  void onSubmit() {
    if (_inputField.text.isEmpty) {
      return;
    }
    widget.handleSubmit(_inputField.text);
    _inputField.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
              onSubmitted: (_) => onSubmit(),
            ),
          ),
        ));
  }
}
