import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graduation_project/layout/home_page.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key key}) : super(key: key);

  @override

  State<SplashScreen> createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const HomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Container(
        width:double.infinity,
        height:double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fgp.gif'),
            ),
        ),
      ),
    );
  }
}