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
  List<TodoData> data = [
    // TodoData(
    //     text:
    //         'Hello this is the Second todo scasdcadcsac dg dsusd dc sduchh dc sdcsdcy dcid sd sdi sdvid sd viudv sdiuv sduid vuid vsdiuv '),
    // TodoData(text: 'Hello this is the Second todo'),
    // TodoData(text: 'Hello this is the Second todo'),
  ];

  void addTodo(String todoTxt) {
    setState(() {
      data.add(TodoData(text: todoTxt));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Grettings(),
              NewTodo(addTodo),
              NewTodoList(data),
            ],
          ),
        ),
      ),
    );
  }
}
