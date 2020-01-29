import 'package:flutter/material.dart';
import './todo.dart';
import '../models/todoData.dart';

class NewTodoList extends StatefulWidget {
  final List<TodoData> data;
  final Function onDone;
  final Function onRemove;

  NewTodoList(
      {@required this.data, @required this.onDone, @required this.onRemove});

  @override
  _NewTodoListState createState() => _NewTodoListState();
}

class _NewTodoListState extends State<NewTodoList> {
  bool switchCondition = false;

  Widget listOfTodos(List<TodoData> dt) {
    if (dt.length > 0) {
      return ListView.builder(
        itemBuilder: (_, i) {
          return Todo(
            key: ValueKey(dt[i].id),
            tData: dt[i],
            onDone: widget.onDone,
            onRemove: widget.onRemove,
          );
        },
        itemCount: dt.length,
      );
    } else {
      return Center(
        child: Text(
          'Please add the todo',
          style: Theme.of(context).textTheme.title,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TodoData> notDoneData =
        widget.data.where((item) => item.isdone == false).toList();
    List<TodoData> doneData =
        widget.data.where((item) => item.isdone == true).toList();
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, bottom: 5, left: 5, right: 5),
      padding: EdgeInsets.only(top: 5.0),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              height: MediaQuery.of(context).size.height * .63,
              margin: EdgeInsets.only(top: 40),
              width: double.infinity,
              child: switchCondition
                  ? listOfTodos(doneData)
                  : listOfTodos(notDoneData),
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
                switchCondition ? 'Done' : 'Todos',
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
              value: switchCondition,
              activeColor: Colors.red,
              onChanged: (bl) {
                setState(() {
                  switchCondition = bl;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
