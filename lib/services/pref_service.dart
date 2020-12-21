import 'dart:convert';
import 'package:pref_demo/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref{
  // for class
  static storeUser(User user) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    preferences.setString('user', stringUser);
  }

  static Future<User> loadUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String stringUser = preferences.getString('user');
    if(stringUser == null || stringUser.isEmpty) {
      return null;
    }
    Map map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove('user');
  }
}