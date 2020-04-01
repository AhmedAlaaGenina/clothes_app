import 'package:clothes_app/model/drawer_model.dart';
import 'package:clothes_app/screens/homepage.dart';
import 'package:clothes_app/screens/drawer_screens/mycart.dart';
import 'package:clothes_app/screens/drawer_screens/shop.dart';
import 'package:flutter/material.dart';

class DrawerUI extends StatefulWidget {
  @override
  _DrawerUIState createState() => _DrawerUIState();
}

class _DrawerUIState extends State<DrawerUI> {
  List<DrawerModel> navDrawer = [
    DrawerModel(
      "Home Page",
      () => HomePage(),
    ),
    DrawerModel(
      "Shop",
      () => Shop(),
    ),
    DrawerModel(
      "Cart",
      () => Cart(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, left: 20),
              child: ListTile(
                title: Text(
                  navDrawer[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => navDrawer[position].destintion(),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: navDrawer.length,
        ),
      ),
    );
  }
}
