import 'package:flutter/material.dart';
// Widgets
import './widgets/new_todo.dart';
import './widgets/grettings.dart';
import './widgets/new_todo_list.dart';
// Models
import './models/todoData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodosApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(28, 35, 33, 1),
              ),
            ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoData> data = [];

  void addTodo(String todoTxt) {
    setState(() {
      data.add(TodoData(text: todoTxt));
    });
  }

  void addDoneTodo(String id) {
    TodoData doneTodo = data.firstWhere((item) => item.id == id);
    setState(() {
      doneTodo.done = !doneTodo.isdone;
      doneTodo.doneDate = DateTime.now();
    });
  }

  void removeData(String id) {
    setState(() {
      data.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Grettings(),
              NewTodo(addTodo),
              NewTodoList(
                data: data.reversed.toList(),
                onDone: addDoneTodo,
                onRemove: removeData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
