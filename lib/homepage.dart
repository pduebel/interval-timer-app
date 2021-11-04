import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int timeLeft = 5;
  late Timer timer;

  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resetTimer() {
    setState(() {
      timeLeft = 5;
      timer.cancel();
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
              timeLeft == 0 ? 'DONE' : timeLeft.toString(),
              style: TextStyle(fontSize: 70),
            ),
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
                    'RESET',
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
