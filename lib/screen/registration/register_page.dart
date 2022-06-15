import 'package:flutter/material.dart';
import 'package:test_app/constants/values.dart';

import '../../functions/functions.dart';
import '../../widget/widgets.dart';
import '../registration/phone_page.dart';
import '../registration/pin_page.dart';
import 'full_info_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  double currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  changePage(index) {
    print('call');
    Functions.hideKeyboard();
    setState(() {
      currentIndex = index.toDouble();
    });
    _pageController.animateToPage(currentIndex.toInt(),
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  // List<Widget> screens = [PhonePage(onTap: changePage(0)), const PinPage(onTap: changePage(1)), FullInfoPage(onTap: changePage(0))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) => changePage(index),
          controller: _pageController,
          children: [
            phonePage(() => changePage(1)),
            pinPage(() => changePage(2), context),
            fullInfoPage(context)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenSize.height * .05,
            ),
            currentIndex.toInt() != 0
                ? CustomWidget.backButton(context,
                    onTap: () => changePage(currentIndex.toInt() - 1))
                : CustomWidget.backButton(context,
                    onTap: () => Navigator.pop(context)),
            Container(
              width: ScreenSize.width,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Row(
                children: List.generate(
                    3,
                    (index) => Expanded(
                        child: CustomWidget.registerProgressBar(
                            index, currentIndex))),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
