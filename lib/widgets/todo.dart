import 'package:flutter/material.dart';
import '../models/todoData.dart';

class Todo extends StatelessWidget {
  final TodoData tData;
  Todo({Key key, @required this.tData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 4,
              height: 50,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  tData.text,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
