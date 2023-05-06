import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // sign in with email and password
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        return result.user!;
      }
      return Future.error("User does not exist.");
    } catch (error) {
      if (error is FirebaseAuthException && error.message != null) {
        return Future.error(error.message!);
      }
      log("Error - signInWithEmailAndPassword : ${error.toString()}");
      return Future.error("Unable to signin.");
    }
  }

  // register with email and password
  Future<User> register({required String name, required String email, required String password, required String regNo, required String phone}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        await result.user!.sendEmailVerification();
        Map<String, dynamic> userData = {
          "name": name,
          "regNo": regNo,
          "phone": phone,
          "email": email,
          "userId": result.user!.uid,
        };
        await FirebaseFirestore.instance.collection('users').doc(result.user!.uid).set(userData);
        return result.user!;
      }
      return Future.error("User does not exist.");
    } catch (error) {
      if (error is FirebaseAuthException && error.message != null) {
        return Future.error(error.message!);
      }
      log("Error - registerWithEmailAndPassword : ${error.toString()}");
      return Future.error("Unable to signup.");
    }
  }

  Future<void> recoverPassword({required String email}) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (error) {
      if (error is FirebaseAuthException && error.message != null) {
        return Future.error(error.message!);
      }
      log("Error - recoverPassword : ${error.toString()}");
      return Future.error("Unable to recover password.");
    }
  }

  Future<void> reSendEmailVerificationLink() async {
    try {
      if (_auth.currentUser != null) {
        return await _auth.currentUser!.sendEmailVerification();
      }
      return Future.error("User does not exist.");
    } catch (error) {
      log("Error - sendEmailVerificationLink : ${error.toString()}");
      return Future.error("Unable to send email verification link.");
    }
  }

  Future<bool> isEmailVerified() async {
    try {
      if (_auth.currentUser != null) {
        await _auth.currentUser!.reload();
        return _auth.currentUser!.emailVerified;
      }
      return Future.error("User does not exist.");
    } catch (error) {
      log("Error - isEmailVerified : ${error.toString()}");
      return Future.error("Unable to verify.");
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      log("Error - signOut : ${error.toString()}");
      return Future.error("Unable to signout.");
    }
  }
}
