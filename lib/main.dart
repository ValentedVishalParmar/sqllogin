import 'package:flutter/material.dart';
//import 'package:shimysqldemo/login_signup.dart';
import 'package:shimysqldemo/splashscreen.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shri hari infotech',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        backgroundColor: Color.fromARGB(255, 255, 255,255)
      ),
      home:new SplashScreen(),
      
    );
  }
}


