import 'package:flutter/material.dart';

// Widget to pick number of rounds
class RoundPicker extends StatelessWidget {
  final int rounds;
  final Function onPressedCallBack;

  const RoundPicker({
    Key? key,
    required this.rounds,
    required this.onPressedCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Rounds',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
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
          child: Row(
            children: <Widget>[
              MaterialButton(
                child: Text('-', style: TextStyle(fontSize: 20)),
                onPressed: () => onPressedCallBack('-'),
              ),
              Text(
                rounds.toString(),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              MaterialButton(
                child: Text('+', style: TextStyle(fontSize: 16)),
                onPressed: () => onPressedCallBack('+'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
