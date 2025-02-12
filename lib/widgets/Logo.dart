import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size = 100;
  const Logo({super.key, size});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/Logo.jpg",width: size,);
  }
}