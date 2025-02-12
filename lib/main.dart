import 'package:depot_boisson/views/agent/home_page.dart';
import 'package:depot_boisson/views/auth/register/login_screen.dart';
import 'package:depot_boisson/views/auth/register/register_screen.dart';
import 'package:depot_boisson/views/auth/splash_screen.dart';
import 'package:depot_boisson/views/shared/map.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) =>  HomePage(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}

