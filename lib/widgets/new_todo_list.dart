import 'package:flutter/material.dart';

class NewTodoList extends StatefulWidget {
  @override
  _NewTodoListState createState() => _NewTodoListState();
}

class _NewTodoListState extends State<NewTodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      // decoration:
      //     BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment(-.6, -.1),
            child: Container(
              width: 100,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                "Todos",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
