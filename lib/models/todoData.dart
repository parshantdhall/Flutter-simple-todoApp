import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

class TodoData {
  final String text;
  final String id = Uuid().v1();
  bool isdone = false;
  Color tColor;
  TodoData({@required this.text}) {
    List<Color> colors = [
      Color.fromRGBO(247, 247, 255, 1),
      Color.fromRGBO(255, 217, 206, 1),
      Color.fromRGBO(189, 213, 234, 1),
      Color.fromRGBO(219, 84, 97, 1),
      Color.fromRGBO(89, 60, 143, 1),
    ];
    this.tColor = colors[Random().nextInt(colors.length)];
  }
  set done(bool dn) {
    isdone = dn;
  }
}
