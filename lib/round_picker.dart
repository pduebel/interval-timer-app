import 'package:flutter/material.dart';

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
    return Row(
      children: [
        const Text(
          'Rounds',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        MaterialButton(
          child: const Text('-'),
          onPressed: () => onPressedCallBack('-'),
        ),
        Text(rounds.toString(),
            style: TextStyle(
              color: Colors.white,
            )),
        MaterialButton(
          child: const Text('+'),
          onPressed: () => onPressedCallBack('+'),
        )
      ],
    );
  }
}
