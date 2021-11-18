import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final int activityTime;
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
  late Timer _timer;
  String _currentPeriod = 'activity';
  late int _timeLeft = widget.activityTime;
  double _roundsCompleted = 0.0;

  void _startCountDown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _roundsCompleted += 0.5;
        if (_currentPeriod == 'activity' && _roundsCompleted < widget.rounds) {
          setState(() {
            _timeLeft = widget.restTime;
            _currentPeriod = 'rest';
          });
        } else if (_currentPeriod == 'rest' &&
            _roundsCompleted < widget.rounds) {
          setState(() {
            _timeLeft = widget.activityTime;
            _currentPeriod = 'activity';
          });
        } else {
          _timer.cancel();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '${(_timeLeft ~/ 60)}'.padLeft(2, '0') +
                  ':' +
                  '${_timeLeft % 60}'.padLeft(2, '0'),
            ),
            MaterialButton(
              child: Text('Start'),
              onPressed: _startCountDown,
            ),
            MaterialButton(
              child: Text('Pause'),
              onPressed: () {
                _timer.cancel();
              },
            ),
            MaterialButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
