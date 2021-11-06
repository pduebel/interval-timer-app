import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  int _startTime = 0;
  int _timeLeft = 0;
  late Timer timer;
  bool _timing = false;
  int _activityMinutes = 0;
  int _activitySeconds = 0;

  void _startTimer() {
    setState(() {
      _timeLeft = _startTime;
      _timing = true;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resetTimer() {
    setState(() {
      timer.cancel();
      _timing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: [
                Column(
                  children: <Widget>[
                    Text('Activity'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        NumberPicker(
                          itemWidth: 50,
                          minValue: 0,
                          maxValue: 120,
                          value: _activityMinutes,
                          onChanged: (value) =>
                              setState(() => _activityMinutes = value),
                        ),
                        Text('min'),
                        NumberPicker(
                          itemWidth: 50,
                          minValue: 0,
                          maxValue: 60,
                          value: _activitySeconds,
                          onChanged: (value) =>
                              setState(() => _activitySeconds = value),
                        ),
                        Text('sec')
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
