import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_geeksgeeks/quiz/answer.dart';
import 'package:quizz_geeksgeeks/quiz/models/question.dart';
import 'package:quizz_geeksgeeks/quiz/quiz_bloc.dart';
import 'package:quizz_geeksgeeks/result.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final QuizBloc bloc;
  final bool isLastQuestion;

  const QuestionWidget({
    required this.question,
    required this.bloc,
    required this.isLastQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTitle(),
            _buildAnswers(),
          ],
        ),
      ),
    ); //Container
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        question.text,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ), //Text
    );
  }

  Widget _buildAnswers() {
    return Expanded(
      child: ListView.builder(
        itemCount: question.anwsers.length,
        itemBuilder: (context, index) {
          return Answer(
            () async {
              if (isLastQuestion) {
                await saveAnswer(context: context, score: bloc.userScore.toString());
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Result(
                      resultScore: bloc.userScore,
                    ),
                  ),
                );
                bloc.reset();
              } else {
                if (index == question.correctAnwser) {
                  bloc.increaseScore();
                }
                bloc.nextPage();
              }
            },
            question.anwsers[index],
          );
        },
      ),
    );
  }

  Future<void> saveAnswer({required BuildContext context, required String score}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update({"score": score});
        log("Score saved to db");
      } else {
        log("User not found");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
