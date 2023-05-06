import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback onTap;
  final String answerText;

  Answer(this.onTap, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: Color(0xFF00E676),
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: onTap,
      ), //RaisedButton
    ); //Container
  }
}
