import 'dart:async';

import 'package:depot_boisson/views/auth/register/login_screen.dart';
import 'package:depot_boisson/widgets/Logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.push(context, 
      MaterialPageRoute(builder: (context)=> LoginScreen()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(child: Logo(),)
    );
  }
}