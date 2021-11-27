import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/round_button.dart';

// Page that displays timer countdown
class TimerPage extends StatefulWidget {
  final int activityTime;
  final int restTime;
  final int rounds;

  const TimerPage(
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
    // Countdown while switching between activity and rest time for
    // set number of rounds
    setState(() {
      _timing = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        setState(() {
          _roundsCompleted += 0.5;
        });
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

  void _resetCountDown() {
    setState(() {
      _timeLeft = widget.activityTime;
      _currentPeriod = 'Activity';
      _roundsCompleted = 0.0;
      _timing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _currentPeriod == 'Activity'
                ? const <Color>[Color(0xff5aff15), Color(0xff00b712)]
                : const <Color>[Color(0xfffbd72b), Color(0xfff9484a)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(_currentPeriod,
                  style: const TextStyle(color: Colors.white, fontSize: 26)),
              (_timeLeft == 0) && (_roundsCompleted == widget.rounds)
                  ? const Text('DONE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 90,
                      ))
                  : Text(
                      '${(_timeLeft ~/ 60)}'.padLeft(2, '0') +
                          ':' +
                          '${_timeLeft % 60}'.padLeft(2, '0'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 90,
                      )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  (_timeLeft == 0) && (_roundsCompleted == widget.rounds)
                      ? RoundButton(
                          text: 'Reset',
                          onPressedCallBack: _resetCountDown,
                        )
                      : _timing
                          ? RoundButton(
                              text: 'Pause',
                              onPressedCallBack: _pauseCountDown,
                            )
                          : RoundButton(
                              text: 'Start',
                              onPressedCallBack: _startCountDown,
                            ),
                  RoundButton(
                    text: 'Cancel',
                    onPressedCallBack: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
