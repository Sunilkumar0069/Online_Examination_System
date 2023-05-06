import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color progressColor;
  const CustomProgressIndicator({
    this.progressColor = Colors.green,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: CircularProgressIndicator(
        color: progressColor,
        strokeWidth: 3,
      ),
    );
  }
}
