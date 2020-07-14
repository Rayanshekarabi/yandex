import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translate/translate.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textContoroler = new TextEditingController();
  GoogleTranslator translator = GoogleTranslator();

  var translatedPharse = '';

//this is api key for yandex
  String api_Url =
      'https://dictionary.yandex.net/api/v1/dicservice.json/getLangs?key=dict.1.1.20200713T093912Z.e4c212ae7c962277.b4ea79e0c359d8f6fd8210efdc407a138a5afd2f';

  Future<String> makeRequest() async {
    var response = await http.get(api_Url);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Center(
          child: new Text(
            'Yandex Translator',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: new Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          controller: textContoroler,
                        ),
                      ),
                      MaterialButton(
                        child: new Text('Translate',
                            style: TextStyle(color: Colors.white)),
                        color: Colors.redAccent,
                        onPressed: () {
                          setState(() {
                            translator
                                .translate(textContoroler.text,
                                    from: 'en', to: "fa")
                                .then((t) {
                              setState(() {
                                translatedPharse = t;
                              });
                            });
                          });

                          //this is for yandex but it does not work

                          // setState(() {
                          //   DetectIt(api_Url).detect(textContoroler.text,hint: ['en','de','ru']).then((translatedPharse){
                          //   setState(() {
                          //     makeRequest();
                          //   });
                          // });
                          // });
                        },
                      )
                    ],
                  ),
                )),
            Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.redAccent,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(
                        translatedPharse,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                              child: Icon(Icons.clear), onPressed: () {
                                setState(() {
                                  translatedPharse = "";
                                  textContoroler.text = "";
                                });
                              }),
                          MaterialButton(
                              child: Icon(Icons.content_copy),
                              onPressed: () {
                                Clipboard.setData(new ClipboardData(text: translatedPharse));

                              }),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
