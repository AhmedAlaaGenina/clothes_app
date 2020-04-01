import 'package:clothes_app/model/splash_model.dart';
import 'package:clothes_app/screens/homepage.dart';
import 'package:clothes_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int currentIndex = 0;

  Widget _displayIndicator(int position) {
    return DotsIndicator(
      dotsCount: Pages.length,
      // position: position,
      decorator: DotsDecorator(
        color: Colors.grey,
        activeColor: Colors.red,
      ),
    );
  }

  List<SplashModel> Pages;
  void _page() {
    Pages = List<SplashModel>();
    Pages.add(
      SplashModel(
        title: 'Fashion',
        description:
            '1-Fashion is a popular aesthetic expression in a certain time and context, especially in clothing, footwear, lifestyle, accessories, makeup, hairstyle and body proportions.',
        icon: Icons.ac_unit,
        image: 'assets/fi.png',
      ),
    );
    Pages.add(
      SplashModel(
        title: 'Fashion',
        description:
            '2-Fashion is a popular aesthetic expression in a certain time and context, especially in clothing, footwear, lifestyle, accessories, makeup, hairstyle and body proportions.',
        icon: Icons.ac_unit,
        image: 'assets/f2.png',
      ),
    );
    Pages.add(
      SplashModel(
        title: 'Fashion',
        description:
            '3-Fashion is a popular aesthetic expression in a certain time and context, especially in clothing, footwear, lifestyle, accessories, makeup, hairstyle and body proportions.',
        icon: Icons.ac_unit,
        image: 'assets/f3.png',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _page();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, position) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(Pages[position].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Pages[position].icon,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text(
                        Pages[position].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 60),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          Pages[position].description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: Pages.length,
            onPageChanged: (position) {
              setState(
                () {
                  currentIndex = position;
                },
              );
            },
          ),
          Transform.translate(
            offset: Offset(0, 175),
            child: Align(
              alignment: Alignment.center,
              child: _displayIndicator(currentIndex),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 17, right: 17),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          _UpDateSeen();
                          return Login();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  color: Colors.black54,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _UpDateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
