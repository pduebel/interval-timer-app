import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PickerPair extends StatefulWidget {
  const PickerPair({Key? key}) : super(key: key);

  @override
  _PickerPairState createState() => _PickerPairState();
}

class _PickerPairState extends State<PickerPair> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Activity'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              NumberPicker(
                itemWidth: 50,
                minValue: 0,
                maxValue: 120,
                value: _activityMinutes,
                onChanged: (value) => setState(() => _activityMinutes = value),
              ),
              Text('min'),
              NumberPicker(
                itemWidth: 50,
                minValue: 0,
                maxValue: 60,
                value: _activitySeconds,
                onChanged: (value) => setState(() => _activitySeconds = value),
              ),
              Text('sec')
            ],
          ),
        ],
      ),
    );
  }
}
