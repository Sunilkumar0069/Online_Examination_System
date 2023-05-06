import 'package:flutter/material.dart';

class QuizBloc {
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  void reset() {
    pageController.jumpTo(0);
  }

  int userScore = 0;

  void increaseScore() {
    userScore += 10;
  }
}
