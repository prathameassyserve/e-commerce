import 'package:e_commerce/ui/sign_in/sign_in.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routName: (context) => SplashScreen(),
  SignIn.routeName: (context) => SignIn(),
};
