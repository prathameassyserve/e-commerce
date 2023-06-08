import 'package:e_commerce/constants.dart';
import 'package:e_commerce/ui/sign_in/components/body_sign_in.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          kSignIn,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BodySignIn(),
    );
  }
}
