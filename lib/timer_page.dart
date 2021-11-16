import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  int activityTime;
  final int restTime;
  final int rounds;

  TimerPage(
      {Key? key,
      required this.activityTime,
      required this.restTime,
      required this.rounds})
      : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        widget.activityTime--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('${(widget.activityTime ~/ 60)}'.padLeft(2, '0') +
          ':' +
          '${widget.activityTime % 60}'.padLeft(2, '0')),
    );
  }
}
