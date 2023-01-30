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
  bool _isVisible = false;
  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // should be responsible for showing fade effect and navigating to login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).secondaryHeaderColor
          ],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1000),
        child: Center(
          heightFactor: 140.0,
          widthFactor: 140.0,
          child: Center(
              child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 500,
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

  // Widget build(BuildContext context) {
  //   return Container(
  //     decoration: new BoxDecoration(
  //       gradient: new LinearGradient(
  //         colors: [
  //           Theme.of(context).colorScheme.secondary,
  //           Theme.of(context).primaryColor
  //         ],
  //         begin: const FractionalOffset(0, 0),
  //         end: const FractionalOffset(1.0, 0.0),
  //         stops: [0.0, 1.0],
  //         tileMode: TileMode.clamp,
  //       ),
  //     ),
  //     child: AnimatedOpacity(
  //       opacity: _isVisible ? 1.0 : 0,
  //       duration: Duration(milliseconds: 1200),
  //       child: Center(
  //         child: Container(
  //           height: 140.0,
  //           width: 140.0,
  //           child: Center(
  //             child: ClipOval(
  //                 child: Image(
  //               image: AssetImage('assets/images/logo.png'),
  //               // width: 1200,
  //               //height: 1200,
  //             ) //put your logo here
  //                 ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
