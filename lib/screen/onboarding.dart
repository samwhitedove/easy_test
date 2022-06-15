import 'package:flutter/material.dart';
import '/constants/colors.dart';
import '/constants/values.dart';
import '/screen/registration/register_page.dart';
import '/widget/widgets.dart';

import '../constants/images.dart';
import 'registration/phone_page.dart';

// ignore: must_be_immutable
class Onboarding extends StatefulWidget {
  Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController(initialPage: 0);
  double currentIndex = 0;

  changeValue(double index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(currentIndex.toInt(),
          curve: Curves.linear, duration: Duration(milliseconds: 500));
      debugPrint(currentIndex.toString());
    });
  }

  goNext() {
    if (currentIndex == data.length - 1) return;
    setState(() {
      currentIndex += 1;
      _pageController.animateToPage(currentIndex.toInt(),
          curve: Curves.linear, duration: Duration(milliseconds: 500));
      debugPrint(currentIndex.toString());
    });
  }

  List data = [
    {
      'bgImage': Images.page_one_onboard,
      'imageIllustration': Images.loan,
      'title': 'Manage your Finances',
      'subtitle': 'It would only take few minutes we promise'
    },
    {
      'bgImage': Images.page_three_onboard,
      'imageIllustration': Images.payment,
      'title': 'Pay Bills',
      'subtitle':
          'It would only take few minute we promise take few minute we promise'
    },
    {
      'bgImage': Images.page_two_onboard,
      'imageIllustration': Images.loan,
      'title': 'Instant Loan',
      'subtitle':
          'It would only take few minute we It would only take few minute promise'
    },
  ];

  @override
  Widget build(BuildContext context) {
    ScreenSize.height = MediaQuery.of(context).size.height;
    ScreenSize.width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) => changeValue(index.toDouble()),
              children: List.generate(
                  data.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(
                            top: index == 1
                                ? 22
                                : index == 2
                                    ? 19
                                    : 8.0),
                        child: CustomWidget.onboard(context,
                            title: data[index]['title'],
                            subtitle: data[index]['subtitle'],
                            // bgImage: data[index]['bgImage'],
                            imageIllustration: data[index]
                                ['imageIllustration']),
                      ))),
          Positioned(
              bottom: ScreenSize.height / 3.5,
              child: Center(
                  child: SizedBox(
                      width: ScreenSize.width,
                      child: CustomWidget.pageDot(
                          size: data.length,
                          currentIndex: currentIndex,
                          color: MyColor.primaryColor)))),
          Positioned(
            bottom: ScreenSize.height / 8,
            child: SizedBox(
              width: ScreenSize.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: twoButton(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget twoButton(context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: currentIndex == 2 ? 0 : 90,
        height: currentIndex == 2 ? 0 : 45,
        child: ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Register()))),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: const BorderSide(color: MyColor.textColor))),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => MyColor.white),
            ),
            child: Text(currentIndex == 2 ? "":'Skip',
                style: const TextStyle(color: MyColor.textColor, fontSize: 16))),
      ),
      Flexible(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: currentIndex == 2 ? ScreenSize.width * .9 : 90,
          height: 45,
          child: ElevatedButton(
            onPressed: buttonAction,
            child: Text( currentIndex == 2 ? 'Create Account' : 'Next',
                style: const TextStyle(color: MyColor.white, fontSize: 16)),
          ),
        ),
      ),
    ]);
  }

  buttonAction(){
    currentIndex == 2 ?  Navigator.push(
            context, MaterialPageRoute(builder: ((context) => const Register()))) : goNext() ;
  }
}
