import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffix extends StatelessWidget {
  const CustomSuffix({
    super.key,
    required this.iconName,
  });

  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
          getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
      child: SvgPicture.asset(
        iconName,
        height: getProportionateScreenHeight(18),
      ),
    );
  }
}
