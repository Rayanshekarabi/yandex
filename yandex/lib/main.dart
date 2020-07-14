import "package:flutter/material.dart";
import 'package:yandex/pages/home_screen.dart';
import 'package:yandex/pages/splash_screen.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yandex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent
      ),
      home: SplashScreen(),


    );
  }
}