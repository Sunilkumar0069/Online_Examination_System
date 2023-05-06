import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_geeksgeeks/authentication/email_verification.dart';
import 'package:quizz_geeksgeeks/authentication/login/login.dart';
import 'package:quizz_geeksgeeks/quiz/quiz.dart';
import 'package:quizz_geeksgeeks/utils/constants.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  void changeView({required bool value}) {
    setState(() {
      emailVerified = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (user != null) {
      log("user!.emailVerified : ${user.emailVerified}");
      log("emailVerified : $emailVerified");
      if (user.emailVerified || emailVerified) {
        emailVerified = false;
        return Quiz();
      } else {
        return EmailVerificationScreen(changeView: changeView);
      }
    }
    return const LoginPage();
  }
}
