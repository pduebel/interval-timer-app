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
  String _currentPeriod = 'Activity';
  late int _timeLeft = widget.activityTime;
  double _roundsCompleted = 0.0;
  bool _timing = false;

  void _startCountDown() {
    setState(() {
      _timing = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _roundsCompleted += 0.5;
        if (_currentPeriod == 'Activity' && _roundsCompleted < widget.rounds) {
          setState(() {
            _timeLeft = widget.restTime;
            _currentPeriod = 'Rest';
          });
        } else if (_currentPeriod == 'Rest' &&
            _roundsCompleted < widget.rounds) {
          setState(() {
            _timeLeft = widget.activityTime;
            _currentPeriod = 'Activity';
          });
        } else {
          _timer.cancel();
        }
      }
    });
  }

  void _pauseCountDown() {
    setState(() {
      _timing = false;
      _timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(_currentPeriod),
            Text(
              '${(_timeLeft ~/ 60)}'.padLeft(2, '0') +
                  ':' +
                  '${_timeLeft % 60}'.padLeft(2, '0'),
            ),
            _timing
                ? MaterialButton(
                    child: const Text('Pause'),
                    onPressed: _pauseCountDown,
                  )
                : MaterialButton(
                    child: const Text('Start'),
                    onPressed: _startCountDown,
                  ),
            MaterialButton(
              child: const Text('Cancel'),
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
