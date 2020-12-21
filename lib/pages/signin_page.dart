import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pref_demo/pages/home_page.dart';
import 'package:pref_demo/pages/signup_page.dart';
import 'package:pref_demo/services/pref_service.dart';

class SignInPage extends StatefulWidget {

  static final String id = 'signin_page';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  void _doSignIn() {
    String email = _emailController.text.toString().trim();
    String password = _passwordController.text.toString().trim();

    Pref.loadUser().then((user) {
      setState(() {
        if(email == user.email && password == user.password) {
          Navigator.pushReplacementNamed(context, HomePage.id);
        } else {
          _emailController.clear();
          _passwordController.clear();
          _dialog('Password or email is invalid! Try again!');
        }
      });
    });
  }

  void _dialog(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Warning'),
            content: Text(text),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),

              // #image
              Container(
                height: 200,
                width: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login.jpg'),
                    fit: BoxFit.cover,
                  )
                ),
                child: Container(
                  height: 200,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.2)
                  ),
                ),
              ),

              // #text
              Text("Welcome back!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),
              SizedBox(height: 8,),
              Text('Log in to your existant account of Q Allure', style: TextStyle(color: Colors.grey),),
              SizedBox(height: 30,),

              // #textfield
              Container(
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blue,)
                ),
                child: TextField(
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15),
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Feather.user, color: Colors.blue, size: 18,),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Feather.lock, color: Colors.grey[400], size: 16,),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15)
                  ),
                ),
              ),

              // #forgot password
              GestureDetector(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password?', style: TextStyle(fontWeight: FontWeight.w500),),
                ),
              ),

              // #login
              SizedBox(height: 20,),
              Container(
                height: 55,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(27.5),
                ),
                child: FlatButton(
                  child: Text('LOG IN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                  onPressed: () {
                    _doSignIn();
                  },
                ),
              ),
              SizedBox(height: 30,),

              Text('Or connect using', style: TextStyle(color: Colors.grey),),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 35,),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MaterialCommunityIcons.facebook, color: Colors.white, size: 20,),
                            SizedBox(width: 5,),
                            Text('Facebook', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(AntDesign.google, color: Colors.white, size: 20,),
                            SizedBox(width: 5,),
                            Text('Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 35,),
                ],
              ),

              // #signup
              SizedBox(height: 45,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    child: Text('Sign Up', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignUpPage.id);
                    },
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
