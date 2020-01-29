import 'package:flutter/material.dart';
import './todo.dart';
import '../models/todoData.dart';

class NewTodoList extends StatelessWidget {
  final List<TodoData> data;
  final Function onDone;

  NewTodoList(this.data, this.onDone);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              height: MediaQuery.of(context).size.height * .62,
              margin: EdgeInsets.only(top: 40),
              width: double.infinity,
              child: data.length > 0
                  ? ListView.builder(
                      itemBuilder: (_, i) {
                        return !data[i].isdone
                            ? Todo(
                                key: ValueKey(data[i].id),
                                tData: data[i],
                                onDone: onDone,
                              )
                            : null;
                      },
                      itemCount: data.length,
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
                style: Theme.of(context).textTheme.title.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          // Switch For Done todo
          Positioned(
            right: 5,
            child: Switch(
              value: false,
              activeColor: Colors.red,
              onChanged: (bl) {
                print(bl);
              },
            ),
          )
        ],
      ),
    );
  }
}
