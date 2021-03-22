import 'package:flutter/material.dart';
import 'package:image_text_converter/Screens/splash_screen.dart';

void main() {
  runApp(ImageToText());
}

class ImageToText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.teal, brightness: Brightness.light),
      home: MySplashScreen(),
      title: 'Image To Text Converter',
    );
  }
}
