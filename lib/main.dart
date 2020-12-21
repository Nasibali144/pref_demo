import 'package:flutter/material.dart';
import 'package:pref_demo/pages/home_page.dart';
import 'package:pref_demo/pages/signin_page.dart';
import 'package:pref_demo/pages/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        SignUpPage.id: (context) => SignUpPage(),
        SignInPage.id: (context) => SignInPage(),
      },
    );
  }
}
