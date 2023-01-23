import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'pages/splash_screen.dart';

void main() {
  runApp(LoginUIApp());
}

class LoginUIApp extends StatelessWidget {
  LoginUIApp({super.key});
  Color _primaryColor = HexColor('#000080');
  Color _accentColor = HexColor('FFA500');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hercules Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
            .copyWith(secondary: _accentColor),
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const SplashScreen(title: 'Hercules Login UI'),
    );
  }
}
