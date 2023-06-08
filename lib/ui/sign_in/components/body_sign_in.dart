import 'package:e_commerce/constants.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/custom_suffix_icon.dart';

class BodySignIn extends StatefulWidget {
  const BodySignIn({Key? key}) : super(key: key);

  @override
  State<BodySignIn> createState() => _BodySignInState();
}

class _BodySignInState extends State<BodySignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            children: [
              Text(
                kWelcomeBack,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                kWelcomeBackSub,
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              SignInForm()
            ],
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: kEmail,
                hintText: kEnterYourEmail,
                suffixIcon: CustomSuffix(
                  iconName: Assets.iconsMail,
                )),
          )
        ],
      ),
    );
  }
}
