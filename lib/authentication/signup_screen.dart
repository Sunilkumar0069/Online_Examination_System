import 'package:flutter/material.dart';
import 'package:quizz_geeksgeeks/services/auth_service.dart';
import 'package:quizz_geeksgeeks/utils/custom_toast.dart';
import 'package:quizz_geeksgeeks/utils/progress_indicator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // late String email, password;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController regNoController;
  late TextEditingController phoneController;
  late TextEditingController nameController;
  bool isSignupBtnClicked = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    regNoController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();
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

  Widget _buildnameRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.name,
        // onChanged: (value) {
        //   setState(() {
        //     email = value;
        //   });
        // },
        controller: nameController,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.green,
            ),
            labelText: 'Full Name'),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _buildRoll_NoRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        // onChanged: (value) {
        //   setState(() {
        //     email = value;
        //   });
        // },
        controller: regNoController,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.green,
            ),
            labelText: 'Reg Number'),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _buildPhone_NoRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        // onChanged: (value) {
        //   setState(() {
        //     email = value;
        //   });
        // },
        controller: phoneController,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.green,
            ),
            labelText: 'Phone'),
      ),
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        // onChanged: (value) {
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

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        isSignupBtnClicked
            ? const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: CustomProgressIndicator(),
              )
            : Container(
                height: 1.4 * (MediaQuery.of(context).size.height / 20),
                width: 5 * (MediaQuery.of(context).size.width / 10),
                margin: const EdgeInsets.only(bottom: 20),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  elevation: 5.0,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () async {
                    await onSignupBtnClicked();
                  },
                  child: Text(
                    "Signup",
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
        // height: MediaQuery.of(context).size.height * 0.6,
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
                  "Signup",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 30,
                  ),
                ),
              ],
            ),
            _buildnameRow(),
            _buildRoll_NoRow(),
            _buildPhone_NoRow(),
            _buildEmailRow(),
            _buildPasswordRow(),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff2f3f7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
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
                      ],
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onSignupBtnClicked() async {
    if (!isSignupBtnClicked) {
      setState(() {
        isSignupBtnClicked = true;
      });
      try {
        if (nameController.text.isNotEmpty && regNoController.text.isNotEmpty && phoneController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
          await AuthService().register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            regNo: regNoController.text,
            phone: phoneController.text,
          );
          Navigator.pop(context);
        } else {
          CustomToast.show(message: "Please fill all fields.");
        }
      } catch (e) {
        CustomToast.show(message: e.toString());
      }
      setState(() {
        isSignupBtnClicked = false;
      });
    }
  }
}

class FontAwesomeIcons {
  static IconData? google;
}
