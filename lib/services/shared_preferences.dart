import 'package:shared_preferences/shared_preferences.dart';

class SP {
  static Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      bool isLoggedin = prefs.getBool('isLoggedin') ?? false;
      return isLoggedin;
    } catch (e) {
      return false;
    }
  }

  static Future<void> storeLogin(bool isLoggedin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedin', isLoggedin);
  }

  static Future<bool> storeLoginInfo(String email, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      prefs.setString('password', password);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<LoginInfo> getLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? '';
    String password = prefs.getString('password') ?? '';
    return LoginInfo(email: email, password: password);
  }
}

class LoginInfo {
  String email;
  String password;

  LoginInfo({required this.email, required this.password});
}
