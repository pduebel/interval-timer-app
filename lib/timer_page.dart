import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final int activityMinutes;
  final int activitySeconds;
  final int restMinutes;
  final int restSeconds;
  final int rounds;

  const TimerPage(
      {Key? key,
      required this.activityMinutes,
      required this.activitySeconds,
      required this.restMinutes,
      required this.restSeconds,
      required this.rounds})
      : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
