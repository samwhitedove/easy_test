import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:test_app/constants/colors.dart';
import 'package:test_app/constants/images.dart';
import 'package:test_app/constants/word.dart';

import '../home.dart';
import '../landing_page.dart';

class CongratulationPage extends StatefulWidget {
  CongratulationPage({Key? key}) : super(key: key);

  @override
  State<CongratulationPage> createState() => _CongratulationPageState();
}

class _CongratulationPageState extends State<CongratulationPage> {
  @override
  void initState() {
    startTimer();
    super.initState();
    gotoNext();
  }

  gotoNext() async {
    await Future.delayed(Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LandingPage(),
        ));
  }

  late Timer _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start >= 100) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            if(_start == 90)
              _start += 10;
            else
              _start += 30;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 8.0, top: MediaQuery.of(context).size.height * .06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Registration Successful',
                    style: TextStyle(
                        fontFamily: Font.myFont,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: MyColor.text),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset(
                      Images.champagne,
                      scale: 4,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'Please wait while we create your account. This will only take few seconds.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: Font.myFont,
                    fontSize: 14,
                    color: MyColor.text,
                    fontWeight: FontWeight.w500),
              )),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .2),
              child: Image.asset(Images.celebration, scale: 5),
            )),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$_start%',
                        style: TextStyle(
                          fontFamily: Font.myFont,
                          fontSize: 14,
                          color: MyColor.mtext,
                          fontWeight: FontWeight.bold,
                        )),
                    //TODO remove
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Home(
                                    title: "Home",
                                  )))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Preparing Dashboard',
                            style: TextStyle(
                                fontFamily: Font.myFont,
                                fontSize: 12,
                                color: MyColor.mtext)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  Container textField({controller}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          // color: MyColor.primaryColor,
          borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InternationalPhoneNumberInput(
        formatInput: false,
        countrySelectorScrollControlled: false,
        spaceBetweenSelectorAndTextField: 0,
        onInputChanged: (PhoneNumber number) {
          print(number.phoneNumber);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        textStyle: TextStyle(color: MyColor.text, fontSize: 16),
        selectorConfig: const SelectorConfig(
          showFlags: false,
          useEmoji: true,
          // setSelectorButtonAsPrefixIcon: true,
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        // ignoreBlank: false,
        inputBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            gapPadding: 10,
            borderSide: BorderSide.lerp(BorderSide(width: 5, color: Colors.red),
                BorderSide(width: 5, color: Colors.green), 2)),
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(
          color: MyColor.text,
          fontFamily: Font.myFont,
        ),
        initialValue: number,
        textFieldController: controller,
        // formatInput: false,
        keyboardType:
            TextInputType.numberWithOptions(signed: true, decimal: true),
        // inputBorder: InputBorder.none,
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
  }
}
