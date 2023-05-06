import 'package:flutter/material.dart';
import 'package:quizz_geeksgeeks/services/auth_service.dart';

class Result extends StatelessWidget {
  final int resultScore;

  const Result({required this.resultScore});

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 170) {
      resultText = 'You are awesome!';
    } else if (resultScore >= 150) {
      resultText = 'Pretty likeable!';
    } else if (resultScore >= 100) {
      resultText = 'You need to work more!';
    } else if (resultScore >= 50) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ), //Text
            Text(
              'Score ' '$resultScore',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ), //Text
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'Restart Quiz!',
              ), //Text
              textColor: Colors.blue,
              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: const TextStyle(color: Colors.blue)),
              child: Text(
                'Finish',
              ), //Text
              onPressed: () async {
                await AuthService().signOut();
                Navigator.pop(context);
              },
            ), //FlatButton
          ], //<Widget>[]
        ), //Column
      ),
    ); //Center
  }
}
