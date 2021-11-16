import 'package:flutter/material.dart';

import 'time_picker.dart';
import 'round_picker.dart';
import 'timer_page.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  int _activityMinutes = 0;
  int _activitySeconds = 0;
  int _restMinutes = 0;
  int _restSeconds = 0;
  int _rounds = 0;

  void updateActivity(int value, String unit) {
    if (unit == 'm') {
      setState(() => _activityMinutes = value);
    } else if (unit == 's') {
      setState(() => _activitySeconds = value);
    }
  }

  void updateRest(int value, String unit) {
    if (unit == 'm') {
      setState(() => _restMinutes = value);
    } else if (unit == 's') {
      setState(() => _restSeconds = value);
    }
  }

  void updateRounds(String direction) {
    if (direction == '-') {
      setState(() => _rounds--);
    } else if (direction == '+') {
      setState(() => _rounds++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TimePicker(
                title: 'Activity',
                minutes: _activityMinutes,
                seconds: _activitySeconds,
                onChangeCallBack: updateActivity,
              ),
              TimePicker(
                  title: 'Rest',
                  minutes: _restMinutes,
                  seconds: _restSeconds,
                  onChangeCallBack: updateRest)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundPicker(
                rounds: _rounds,
                onPressedCallBack: updateRounds,
              ),
            ],
          ),
          MaterialButton(
            child: Text('Start'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return TimerPage(
                      activityTime: (_activityMinutes * 60) + _activitySeconds,
                      restTime: (_restMinutes * 60) + _restSeconds,
                      rounds: _rounds,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
