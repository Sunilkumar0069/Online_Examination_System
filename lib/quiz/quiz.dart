import 'package:flutter/material.dart';
import 'package:quizz_geeksgeeks/quiz/quiz_bloc.dart';
import 'package:quizz_geeksgeeks/services/auth_service.dart';
import 'models/question.dart';
import 'question_widget.dart';
import 'package:quizz_geeksgeeks/utils/constants.dart' as constants;

class Quiz extends StatelessWidget {
  Quiz({Key? key}) : super(key: key);
  final QuizBloc _quizBloc = QuizBloc();

  List<Question> get questions => constants.questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _quizBloc.pageController,
              children: questions
                  .map((question) => QuestionWidget(
                        question: question,
                        bloc: _quizBloc,
                        isLastQuestion: questions.indexOf(question) == questions.length - 1,
                      ))
                  .toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await AuthService().signOut();
            },
            child: const Text("Sign out"),
          )
        ],
      ),
    );
  }
}
