import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _startTime = 0;
  int _timeLeft = 0;
  late Timer timer;
  bool _timing = false;

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
            if (!_timing) ...[
              NumberPicker(
                value: _startTime,
                minValue: 0,
                maxValue: 100,
                step: 1,
                haptics: true,
                onChanged: (value) => setState(() => _startTime = value),
              )
            ] else ...[
              Text(
                _timeLeft == 0 ? 'DONE' : _timeLeft.toString(),
                style: TextStyle(fontSize: 70),
              )
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: _startTimer,
                  child: const Text(
                    'START',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 5,
                    ),
                  ),
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: _resetTimer,
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 5,
                    ),
                  ),
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
