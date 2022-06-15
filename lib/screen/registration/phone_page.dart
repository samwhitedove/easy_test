

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../constants/colors.dart';
import '../../constants/values.dart';
import '../../constants/word.dart';

Widget phonePage(onTap){
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CustomWidget.backButton(context),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: List.generate(
            //         4,
            //         (index) => Container(
            //             height: 4,
            //             width: ScreenSize.width * .23,
            //             color: MyColor.green)),
            //   ),
            // ),
            SizedBox(height: ScreenSize.height * .04),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 8.0, top: ScreenSize.height * .06),
              child: Center(
                  child: Text(
                'Create an account',
                style: TextStyle(
                    fontFamily: Font.myFont,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: MyColor.text),
              )),
            ),
            Center(
                child: Text(
              'It would only take few minute we promise',
              style: TextStyle(
                  fontFamily: Font.myFont,
                  fontSize: 16,
                  color: MyColor.text,
                  fontWeight: FontWeight.w500),
            )),
            Container(
              padding: EdgeInsets.only(
                  bottom: 8.0,
                  top: ScreenSize.height * .15,
                  left: 8,
                  right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 4),
                    child: Text('Mobile Number ',
                        style: TextStyle(
                            fontFamily: Font.myFont,
                            fontSize: 12,
                            color: MyColor.mtext)),
                  ),
                  textField(),
                ],
              ),
            ),
            SizedBox(height:ScreenSize.height * .25),
            Center(
              child: SizedBox(
                width: ScreenSize.width * .9,
                height: 45,
                child: ElevatedButton(
                  onPressed: onTap,//Navigator.push(context,  MaterialPageRoute(builder: ((context) => PinPage()))),
                  child: const Text('Next',
                      style: TextStyle(color: MyColor.white, fontSize: 16)),
                ),
              ),
            ),
            SizedBox(height: ScreenSize.width * .04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Text(
                  'By continuing, you confirm that you’re the owner or primary user of this mobile phone number. You agree to receive automated texts to confirm your phone number.',
                  style: TextStyle(
                      fontFamily: Font.myFont,
                      fontSize: 12,
                      color: MyColor.mtext)),
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
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          print(number.phoneNumber);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          showFlags: false,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(color: MyColor.mtext),
        initialValue: number,
        textFieldController: controller,
        formatInput: false, 
        spaceBetweenSelectorAndTextField: 0,
        textStyle: TextStyle(color: MyColor.mtext),
        inputDecoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: MyColor.grey.withOpacity(.5), width: 1)),
          hintText: 'Phone Number',
          hintStyle: TextStyle(color: MyColor.mtext.withOpacity(.5)),
        ),
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
  }
