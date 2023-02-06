import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hercules_login/common/theme_helper.dart';
import 'package:hercules_login/pages/profile_page.dart';

import 'forgot_password_page.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), //change the location of the words.
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  //this is the login form
                  child: Column(
                    children: [
                      Text(
                        'Hercules Group',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Signin into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextField(
                                decoration: ThemeHelper().textInputDecoration(
                                    'User Name', 'Enter your User Name'),
                              ),
                              SizedBox(height: 30.0),
                              TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration(
                                    'Password', 'Enter your Password'),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                // child: Text('Forgot your Password?'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: " Forgot Your Password?",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (Context) =>
                                                    ForgotPasswordPage()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ])),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Sign In'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    //after successful login, we will redirect to profile page (MAKE PROFILE PAGE)
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePage()));
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                // child: Text(
                                //     "Don't have an account? Sign up here!"), //Now style the forms. creating a theme helper class...
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Don't have an account?"),
                                  TextSpan(
                                    text: " Sign up",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (Context) =>
                                                    RegistrationPage()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
