import 'package:clothes_app/shared_ui/drawer.dart';
import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ), //Appbar
      drawer: DrawerUI(),

      body: Center(
        child: Text("This is the Shop page of the app"),
      ), //Center
    ); //Scaffold
  }
}
