import 'package:flutter/material.dart';

// Widgets
import './widgets/new_todo.dart';
import './widgets/grettings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodosApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Top Heading
            Grettings(),
            NewTodo(),
          ],
        ),
      ),
    );
  }
}
