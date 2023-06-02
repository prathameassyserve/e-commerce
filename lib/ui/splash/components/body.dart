import 'package:e_commerce/constants.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:e_commerce/pojo/splash_data.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/ui/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<SplashData> splashData = [
    SplashData(text: kWelcomeToTokoto, image: Assets.imagesSplash1),
    SplashData(text: kWeHelpPeople, image: Assets.imagesSplash2),
    SplashData(text: kWeShowTheEasyWay, image: Assets.imagesSplash3),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index].text,
                  image: splashData[index].image,
                ),
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDots(position: index),
                      ),
                    ),
                    Spacer(flex: 2),
                    DefaultButton(
                      buttonName: kContinue,
                      press: () {
                        print("-->");
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDots({required int position}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: isCurrentPageEqualPosition(position: position) ? 20 : 6,
      decoration: BoxDecoration(
        color: isCurrentPageEqualPosition(position: position)
            ? kPrimaryColor
            : kLightGrey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  bool isCurrentPageEqualPosition({required int position}) =>
      currentPage == position;
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.buttonName,
    required this.press,
  });

  final String buttonName;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(kTextWhiteColor),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: press,
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }
}
