import 'package:flutter/material.dart';
import 'package:image_text_converter/Screens/welcome_screen.dart';

import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new WelcomeScreen(),
      title: new Text(
        'Image To Text Converter',
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      image: new Image.asset(
        'assets/download.png',
        // color: Colors.amber,
      ),
      loadingText: Text("Loading..."),
      photoSize: MediaQuery.of(context).size.width * 0.5,
      loaderColor: Colors.blue,
    );
  }
}
