import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'time_picker.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  int _activityMinutes = 0;
  int _activitySeconds = 0;

  void updateTime(int value) {
    setState(() => _activityMinutes = value);
    NumberPicker.animateInt(value);
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
                TimePicker(
                  title: 'Activity',
                  minutes: _activityMinutes,
                  seconds: _activitySeconds,
                  onChangeCallBack: updateTime,
                ),
                Text(_activityMinutes.toString()),
                Text(_activitySeconds.toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
