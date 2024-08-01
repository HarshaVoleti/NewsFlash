import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashnews/services/shared_preferences.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> checkLogin() async {
    try {
      bool value = await SP.getLogin();
      return value;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      if (email == '') {
        throw Exception("email can't be empty");
      }
      if (password == '') {
        throw Exception("password can't be empty");
      }
      final cred = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .onError((e, StackTrace stackTrace) {
        throw Exception(e);
      });
      print('cred: $cred');
      SP.storeLogin(true);
      SP.storeLoginInfo(email, password);
      var user = FirebaseFirestore.instance
          .collection('users')
          .doc(cred.user!.uid)
          .get()
          .then((value) {
        if (!value.exists) {
          throw Exception('User not found');
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final cred = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      cred.user!.sendEmailVerification();
      if (cred != null) {
        SP.storeLogin(true);
        SP.storeLoginInfo(email, password);
        FirebaseFirestore.instance.collection('users').doc(cred.user!.uid).set({
          'email': email,
          'userId': cred.user!.uid,
          'username': username,
          'createdAt': DateTime.now(),
          'updatedAt': DateTime.now(),
        });
      }
    } catch (e) {
      FirebaseAuth.instance.signOut();
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
      SP.storeLogin(false);
      SP.storeLoginInfo('', '');
    } catch (e) {
      throw Exception(e);
    }
  }
}
