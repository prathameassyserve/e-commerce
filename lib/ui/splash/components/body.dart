import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/generated/assets.dart';
import 'package:e_commerce/pojo/splash_data.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/ui/sign_in/sign_in.dart';
import 'package:e_commerce/ui/splash/components/splash_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PageController _pageController;
  int currentPage = 0;

  List<SplashData> splashData = [
    SplashData(text: kWelcomeToTokoto, image: Assets.imagesSplash1),
    SplashData(text: kWeHelpPeople, image: Assets.imagesSplash2),
    SplashData(text: kWeShowTheEasyWay, image: Assets.imagesSplash3),
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

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
                controller: _pageController,
                itemCount: splashData.length,
                itemBuilder: (context, index) =>
                    SplashContent(
                      text: splashData[index].text,
                      image: splashData[index].image,
                    ),
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                    buildPageController();
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
                      buttonName: currentPage == splashData.length - 1
                          ? kContinue
                          : kNext,
                      press: () {
                        setState(() {
                          if (currentPage <= 1) {
                            currentPage++;
                            buildPageController();
                          } else {
                            Navigator.pushReplacementNamed(
                                context, SignIn.routeName);
                          }
                        });
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

  void buildPageController() {
    _pageController.animateToPage(
      currentPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
