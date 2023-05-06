import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizz_geeksgeeks/authentication/auth_wrapper.dart';
import 'package:quizz_geeksgeeks/services/auth_service.dart';
import 'package:quizz_geeksgeeks/utils/custom_toast.dart';
import 'package:quizz_geeksgeeks/utils/progress_indicator.dart';

class EmailVerificationScreen extends StatefulWidget {
  final Function({required bool value}) changeView;
  const EmailVerificationScreen({required this.changeView, Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isResendBtnClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Verify Your Email",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xfff2f3f7),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Email Verification link has been sent to your registered email",
              style: TextStyle(
                color: Color(0xfff2f3f7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            isResendBtnClicked
                ? const CustomProgressIndicator(progressColor: Colors.white)
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[800],
                    ),
                    onPressed: () async {
                      await onResendBtnClicked();
                    },
                    child: const Text("Resend"),
                  ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[800],
              ),
              onPressed: () async {
                try {
                  bool isVerified = await AuthService().isEmailVerified();
                  widget.changeView(value: isVerified);
                } catch (e) {
                  CustomToast.show(message: e.toString());
                }
              },
              child: const Text("Continue"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[800],
              ),
              onPressed: () async {
                try {
                  await AuthService().signOut();
                } catch (e) {
                  CustomToast.show(message: e.toString());
                }
              },
              child: const Text("Signout"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onResendBtnClicked() async {
    if (!isResendBtnClicked) {
      setState(() {
        isResendBtnClicked = true;
      });
      try {
        await AuthService().reSendEmailVerificationLink();
        CustomToast.show(message: "Verification link sent");
      } catch (e) {
        CustomToast.show(message: e.toString());
      }
      setState(() {
        isResendBtnClicked = false;
      });
    }
  }
}
