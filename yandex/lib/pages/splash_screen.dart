import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yandex/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() { 
    super.initState();
    startTimer();
  }

  startTimer()async{
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(fit: StackFit.expand, children: [
      new Container(
        decoration: BoxDecoration(color: Colors.white),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(
              flex: 2,
              child: new Container(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/yandexlogo.png'),
                        width: 300,
                        height: 150,
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    ]));
  }
}
