import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimePicker extends StatelessWidget {
  final String title;
  final int minutes;
  final int seconds;
  final Function onChangeCallBack;

  const TimePicker(
      {Key? key,
      required this.title,
      required this.minutes,
      required this.seconds,
      required this.onChangeCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              NumberPicker(
                itemHeight: 35,
                itemWidth: 50,
                minValue: 0,
                maxValue: 120,
                value: minutes,
                onChanged: (value) => onChangeCallBack(value, 'm'),
              ),
              const Text('min'),
              NumberPicker(
                itemHeight: 35,
                itemWidth: 50,
                minValue: 0,
                maxValue: 59,
                value: seconds,
                onChanged: (value) => onChangeCallBack(value, 's'),
              ),
              const Text('sec'),
            ],
          ),
        ],
      ),
    );
  }
}
