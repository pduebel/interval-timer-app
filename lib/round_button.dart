import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressedCallBack;

  const RoundButton({
    Key? key,
    required this.text,
    required this.onPressedCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(100, 100),
        side: BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: CircleBorder(),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
      onPressed: onPressedCallBack,
    );
  }
}
