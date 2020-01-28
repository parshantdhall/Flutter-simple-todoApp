import 'package:flutter/material.dart';

class Grettings extends StatefulWidget {
  @override
  _GrettingsState createState() => _GrettingsState();
}

class _GrettingsState extends State<Grettings> {
  String time;
  int currentTime = DateTime.now().hour;

  String getTimeGrettings() {
    print(currentTime);
    if (currentTime < 12) {
      return 'Good Morning';
    } else if (currentTime > 12 && currentTime < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  void initState() {
    super.initState();
    time = getTimeGrettings();
  }

  @override
  Widget build(BuildContext context) {
    if (DateTime.now().hour != currentTime) {
      setState(() {
        currentTime = DateTime.now().hour;
        time = getTimeGrettings();
      });
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      child: Text(
        time,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: 'DancingScript',
          fontSize: 40,
        ),
      ),
    );
  }
}
