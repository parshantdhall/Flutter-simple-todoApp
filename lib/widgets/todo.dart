import 'package:flutter/material.dart';
import '../models/todoData.dart';

class Todo extends StatelessWidget {
  final TodoData tData;
  final Function onDone;
  final Function onRemove;

  Todo({
    Key key,
    @required this.tData,
    @required this.onDone,
    @required this.onRemove,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(tData.id),
      onDismissed: (_) {
        onRemove(tData.id);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete_sweep,
          color: Colors.white,
        ),
      ),
      child: Card(
        // color: tData.tColor,
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: tData.tColor,
                width: 4,
              ),
            ),
          ),
          child: ListTile(
            title: Text(
              tData.text,
              style: tData.isdone
                  ? Theme.of(context).textTheme.title.copyWith(
                        decoration: TextDecoration.lineThrough,
                      )
                  : Theme.of(context).textTheme.title,
            ),
            onLongPress: () => onDone(tData.id),
          ),
        ),
      ),
    );
  }
}
