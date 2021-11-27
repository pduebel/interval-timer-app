import 'package:flutter/material.dart';

import '../widgets/time_picker.dart';
import '../widgets/round_picker.dart';
import 'timer_page.dart';
import '../widgets/round_button.dart';

// Page for user to choose activity/rest time and number of rounds
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xff09c6f9), Color(0xff045de9)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Interval Timer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TimePicker(
                    title: 'Activity',
                    minutes: _activityMinutes,
                    seconds: _activitySeconds,
                    onChangeCallBack: updateActivity,
                  ),
                ),
                Expanded(
                    child: TimePicker(
                        title: 'Rest',
                        minutes: _restMinutes,
                        seconds: _restSeconds,
                        onChangeCallBack: updateRest))
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
            RoundButton(
              text: 'GO',
              onPressedCallBack: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TimerPage(
                        activityTime:
                            (_activityMinutes * 60) + _activitySeconds,
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
      ),
    );
  }
}
