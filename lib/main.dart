import 'package:e_commerce/constants.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:e_commerce/routs.dart';
import 'package:e_commerce/theme.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: theme(),
      //home: SplashScreen(),
      initialRoute: SplashScreen.routName,
      routes: routes,
    );
  }
}
