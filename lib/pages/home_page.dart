import 'package:flutter/material.dart';
import 'package:pref_demo/models/user_model.dart';
import 'package:pref_demo/pages/signin_page.dart';
import 'package:pref_demo/services/pref_service.dart';

class HomePage extends StatefulWidget {

  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static readData() async{
    User user = await Pref.loadUser();
    print(user.name);
    print(user.email);
    print(user.phone);
    print(user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          color: Colors.blueGrey[800],
          child: Text('Read data in console', style: TextStyle(color: Colors.white, fontSize: 22),),
          onPressed: () {
            readData();
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushReplacementNamed(context, SignInPage.id);
        },
      ),
    );
  }
}
