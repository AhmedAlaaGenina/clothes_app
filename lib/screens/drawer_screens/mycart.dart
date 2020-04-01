import 'package:clothes_app/shared_ui/drawer.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ), //Appbar
      drawer: DrawerUI(),

      body: Center(
        child: Text("This is the Cart page of the app"),
      ), //Center
    ); //Scaffold
  }
}
