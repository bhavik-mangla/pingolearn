import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/news_feed_screen.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  Future<void> signin(String email, String password, GlobalKey<State> key, BuildContext context) async {
    try {

      final UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      Navigator.of(
          key.currentContext!)
          .pop();
      if(context.mounted) {

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const NewsFeedScreen()),
              (route) => false,
        );
      }
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      // Handle error

      Navigator.of(
          key.currentContext!)
          .pop();

      print(e.message);


        ScaffoldMessenger.of(key.currentContext!).showSnackBar(SnackBar(
          content: Text(e.code),
          duration: const Duration(seconds: 2),
        ));

    }
  }

  //sign up with email and password, also create a document with name and email
  Future<void> signup(String email, String password, String name, GlobalKey<State> key, BuildContext context) async {
    try {
      final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user = userCredential.user;

      //create a document with name and email
      await FirebaseFirestore.instance.collection('users').doc(_user!.uid).set({
        'name': name,
        'email': email,
      });

      Navigator.of(
          key.currentContext!)
          .pop();
      if(context.mounted) {

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const NewsFeedScreen()),
              (route) => false,
        );
      }

      notifyListeners();
    } on FirebaseAuthException catch ( e) {

      Navigator.of(
          key.currentContext!)
          .pop();


        ScaffoldMessenger.of(key.currentContext!).showSnackBar(SnackBar(
          content: Text(e.code),
          duration: const Duration(seconds: 2),
        ));


    }
  }




  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      // Handle error
      if (kDebugMode)print("Error signing out: $e");
    }
  }


}



