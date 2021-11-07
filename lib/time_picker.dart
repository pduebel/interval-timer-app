import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimePicker extends StatefulWidget {
  final String title;
  int minutes;
  int seconds;
  Function(int) onChangeCallBack;

  TimePicker(
      {Key? key,
      required this.title,
      required this.minutes,
      required this.seconds,
      required this.onChangeCallBack})
      : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(widget.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              NumberPicker(
                itemWidth: 50,
                minValue: 0,
                maxValue: 120,
                value: widget.minutes,
                onChanged: (value) => widget.onChangeCallBack,
              ),
              const Text('min'),
              NumberPicker(
                itemWidth: 50,
                minValue: 0,
                maxValue: 60,
                value: widget.seconds,
                onChanged: (value) => setState(() => widget.seconds = value),
              ),
              const Text('sec'),
            ],
          ),
        ],
      ),
    );
  }
}
