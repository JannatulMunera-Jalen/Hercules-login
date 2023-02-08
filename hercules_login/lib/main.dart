import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(LoginUIApp());
}

class LoginUIApp extends StatelessWidget {
  LoginUIApp({super.key});
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
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
        home: FutureBuilder(
          future: _fbApp,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              print('You have an error! ${snapshot.error.toString()}');
              return Text('Something Went Wrong!');
            } else if (snapshot.hasData) {
              return const SplashScreen(title: 'Hercules Login UI');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        )
        //const SplashScreen(title: 'Hercules Login UI'),
        );
  }
}
