import 'package:flashnews/services/auth_services.dart';
import 'package:flashnews/services/shared_preferences.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool _isLoading = false;
  bool _isLoggedin = false;
  String? _error;
  LoginInfo? _loginInfo;
  AuthServices authServices = AuthServices();

  bool get isLoading => _isLoading;
  bool get isLoggedin => _isLoggedin;
  String? get error => _error;
  LoginInfo? get loginInfo => _loginInfo;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setLoggedIn(bool value) {
    _isLoggedin = value;
    notifyListeners();
  }

  void _setErrorMessage(String? message) {
    _error = message;
    notifyListeners();
  }

  AuthProvider() {
    checkLogin();
    fetchLoginInfo();
  }

  Future<void> loginFromInfo() async {
    _setLoading(true);
    try {
      print('email at provider: $emailController');
      await AuthServices().login(loginInfo!.email, loginInfo!.password);
      print('login success');
      _isLoggedin = true;
      _loginInfo = LoginInfo(
          email: emailController.text, password: passwordController.text);
      _setErrorMessage(null);
      _setLoggedIn(true);
    } catch (e) {
      _setErrorMessage('Login info is invalid');
    } finally {
      _setLoading(false);
    }
  }

  Future<LoginInfo> fetchLoginInfo() async {
    LoginInfo? logininfo = await SP.getLoginInfo();
    _loginInfo = logininfo;
    notifyListeners();
    return logininfo;
  }

  Future<void> checkLogin() async {
    authServices.checkLogin().then((value) {
      _isLoggedin = value;
      notifyListeners();
    });
  }

  Future<void> login() async {
    _setLoading(true);

    try {
      print('email at provider: $emailController');
      await AuthServices().login(emailController.text, passwordController.text);
      print('login success');
      _isLoggedin = true;
      _loginInfo = LoginInfo(
          email: emailController.text, password: passwordController.text);
      _setErrorMessage(null);
      _setLoggedIn(true);
    } catch (e) {
      _setErrorMessage(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> register() async {
    _setLoading(true);

    try {
      await AuthServices().register(
          email: emailController.text,
          password: passwordController.text,
          username: nameController.text);
      _isLoggedin = true;
      _loginInfo = LoginInfo(
          email: emailController.text, password: passwordController.text);
      _setErrorMessage(null);
      _setLoggedIn(true);
    } catch (e) {
      _setErrorMessage(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);

    try {
      await AuthServices().logout();
      _isLoggedin = false;
      _loginInfo = null;
      _setErrorMessage(null);
      _setLoggedIn(false);
    } catch (e) {
      _setErrorMessage(e.toString());
    } finally {
      _setLoading(false);
    }
  }
}
