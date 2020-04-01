import 'package:clothes_app/screens/homepage.dart';
import 'package:clothes_app/screens/login.dart';
import 'package:clothes_app/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screens;
  if (seen == null || seen == false) {
    _screens = Splash();
  } else {
    _screens = Login();
  }

  runApp(MyApp(_screens));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Widget _screen;

  MyApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: this._screen,
    );
  }
}
