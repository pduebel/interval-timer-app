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
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(
            right: 15,
            top: 15,
            bottom: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.white, Color(0xfffcfcfc)],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
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
                    textStyle: TextStyle(color: Colors.grey),
                    onChanged: (value) => onChangeCallBack(value, 'm'),
                  ),
                  const Text('min'),
                  NumberPicker(
                    itemHeight: 35,
                    itemWidth: 50,
                    minValue: 0,
                    maxValue: 59,
                    value: seconds,
                    textStyle: TextStyle(color: Colors.grey),
                    onChanged: (value) => onChangeCallBack(value, 's'),
                  ),
                  const Text('sec'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
