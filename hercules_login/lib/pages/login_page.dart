import 'package:flutter/material.dart';
import 'package:hercules_login/common/theme_helper.dart';

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
                  //this will be the login form
                  child: Column(
                children: [
                  Text(
                    'Hercules Group',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
                            child: Text('Forgot Password?'),
                          ),
                          Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  'Sign In'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onPressed: () {},
                              //after successful login, we will resirect to profile page
                            ),
                          ),
                          Container(
                            child: Text(
                                "Don't have an account? Sign up here!"), //Now style the forms. creating a theme helper class...
                          ),
                        ],
                      )),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
