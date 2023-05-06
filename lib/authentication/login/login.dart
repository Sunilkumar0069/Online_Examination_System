import 'package:flutter/material.dart';
import 'package:quizz_geeksgeeks/authentication/forgetpassword_screen.dart';
import 'package:quizz_geeksgeeks/authentication/signup_screen.dart';
import 'package:quizz_geeksgeeks/services/auth_service.dart';
import 'package:quizz_geeksgeeks/utils/custom_toast.dart';
import 'package:quizz_geeksgeeks/utils/progress_indicator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late List<Map<String, Object>> questions;
  late int questionIndex;
  late Function answerQuestion;

  //late String email, password;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool isLoginBtnClicked = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'PSG EXAM PORTAL',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height / 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        //onChanged: (value) {
        //   setState(() {
        //     email = value;
        //   });
        // },
        controller: emailController,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.green,
            ),
            labelText: 'E-mail'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        // onChanged: (value) {
        //   setState(() {
        //     password = value;
        //   });
        // },
        controller: passwordController,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.green,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPasswordPage()));
          },
          child: const Text("Forgot Password"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        isLoginBtnClicked
            ? const CustomProgressIndicator()
            : SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () async {
                    await onButtonClick();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: MediaQuery.of(context).size.height / 40,
                    ),
                  ),
                ),
              )
      ],
    );
  }

  Widget _buildContainer() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 30,
                  ),
                ),
              ],
            ),
            _buildEmailRow(),
            _buildPasswordRow(),
            _buildForgetPasswordButton(),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignupPage()));
          },
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Dont have an account? ',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: MediaQuery.of(context).size.height / 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 40,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff2f3f7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildLogo(),
                        _buildContainer(),
                        _buildSignUpBtn(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onButtonClick() async {
    if (!isLoginBtnClicked) {
      setState(() {
        isLoginBtnClicked = true;
      });
      try {
        if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
          await AuthService().signIn(email: emailController.text, password: passwordController.text);
        } else {
          CustomToast.show(message: "Email and password cannot be empty");
        }
      } catch (e) {
        CustomToast.show(message: e.toString());
      }
      setState(() {
        isLoginBtnClicked = false;
      });
    }
  }
}

class FontAwesomeIcons {
  static IconData? google;
}
