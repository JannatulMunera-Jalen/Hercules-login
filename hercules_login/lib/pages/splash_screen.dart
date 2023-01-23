import 'dart:async';

import 'package:flutter/material.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor,
        ]),
      ),
      child: const AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          heightFactor: 140.0,
          widthFactor: 140.0,
          child: Center(
              child: Image(
            image: NetworkImage(
                'https://www.herculescarparking.com.au/wp-content/uploads/2019/04/hercules-logo-s.png'),
            width: 350,
          )
              // child: Icon(
              //   Icons.widgets, //PUT YOUR LOGO HERE!!!!!!
              //   size: 122,
              // ),
              ),
        ),
      ),
    );
  }
}
