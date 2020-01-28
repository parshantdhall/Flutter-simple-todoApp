import 'package:flutter/material.dart';
import './todo.dart';
import '../models/todoData.dart';

class NewTodoList extends StatelessWidget {
  final List<TodoData> data;

  NewTodoList(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              height: 280,
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black, width: 2)),
              margin: EdgeInsets.only(top: 35),
              width: double.infinity,
              // color: Colors.white,
              child: data.length > 0
                  ? ListView.builder(
                      itemBuilder: (_, i) {
                        return Todo(
                          tData: data[i],
                        );
                      },
                      itemCount: data.length,
                      reverse: true,
                    )
                  : Center(
                      child: Text(
                        'Please add the todo',
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
            ),
          ),
          // The Todo heading container
          Positioned(
            left: 15,
            top: -15,
            child: Container(
              width: 90,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                "Todos",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
