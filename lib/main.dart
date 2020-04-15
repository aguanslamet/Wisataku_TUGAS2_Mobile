import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisataku/screen/login.dart';




void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override 
  Widget build(BuildContext context) {
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      
    );
  }
}



