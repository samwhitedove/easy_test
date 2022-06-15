import 'package:flutter/material.dart';
import 'package:test_app/constants/colors.dart';
import 'package:test_app/constants/values.dart';
import 'package:test_app/constants/word.dart';
import 'package:test_app/screen/registration/congratulation.dart';

import '../../functions/functions.dart';
import '../../widget/widgets.dart';
import '../privacy.dart';

TextEditingController _fullName = TextEditingController();
TextEditingController _lastName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _referral = TextEditingController();
TextEditingController _password = TextEditingController();
GlobalKey<FormState> _form = GlobalKey();

bool show = true;
showPassword(context) {
  // print(show);
  context.findRootAncestorStateOfType()!.setState(() {
    show = !show;
  print(show);

  });
}

Widget fullInfoPage(context) {
  return Scaffold(
      body: SafeArea(
    child: SingleChildScrollView(
      child: Form(
        key: _form,
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
            //             height: 3,
            //             width: ScreenSize.width * .23,
            //             color: MyColor.green)),
            //   ),
            // ),
            SizedBox(height: ScreenSize.height * .04),
            Padding(
              padding:
                  EdgeInsets.only(bottom: 8.0, top: ScreenSize.height * .06),
              child: Center(
                  child: Text(
                'Set up your profile',
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

            SizedBox(height: ScreenSize.height * .05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 4),
                  child: Text('Full Name ',
                      style: TextStyle(
                          fontFamily: Font.myFont,
                          fontSize: 12,
                          color: MyColor.mtext)),
                ),
                Center(
                    child:
                        CustomWidget.textField('Full Name', _fullName, TextInputType.text, context, 'Full name')),
              ],
            ),
            SizedBox(height: ScreenSize.height * .02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 4),
                  child: Text('Last Name ',
                      style: TextStyle(
                          fontFamily: Font.myFont,
                          fontSize: 12,
                          color: MyColor.mtext)),
                ),
                Center(
                    child:
                        CustomWidget.textField('Last Name ', _lastName, TextInputType.text, context, 'Last name')),
              ],
            ),
            SizedBox(height: ScreenSize.height * .02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 4),
                  child: Text('Email ID ',
                      style: TextStyle(
                          fontFamily: Font.myFont,
                          fontSize: 12,
                          color: MyColor.mtext)),
                ),
                Center(
                    child: CustomWidget.textField(
                        'Email ID ', _email, TextInputType.emailAddress, context, 'Email')),
              ],
            ),
            SizedBox(height: ScreenSize.height * .02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 4),
                  child: Text('Referral(optional) ',
                      style: TextStyle(
                          fontFamily: Font.myFont,
                          fontSize: 12,
                          color: MyColor.mtext)),
                ),
                Center(
                    child: CustomWidget.textField(
                        'Referral(optional) ', _referral, TextInputType.text, context, 'referral')),
              ],
            ),
            SizedBox(height: ScreenSize.height * .02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 4),
                  child: Text('Create Password ',
                      style: TextStyle(
                          fontFamily: Font.myFont,
                          fontSize: 12,
                          color: MyColor.mtext)),
                ),
                Center(
                    child:
                        CustomWidget.passwordTextField('********', _password, TextInputType.text, context,view: show, show: ()=> showPassword(context), 'Password')),
              ],
            ),

            SizedBox(height: ScreenSize.height * .05),
            Center(
              child: SizedBox(
                width: ScreenSize.width * .9,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Functions.hideKeyboard();
                    if(!_form.currentState!.validate()) return;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => CongratulationPage())));
                  },
                  child: const Text('Next',
                      style: TextStyle(color: MyColor.white, fontSize: 16)),
                ),
              ),
            ),
            SizedBox(height: ScreenSize.width * .04),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Text(
                    'By proceeding to create your account, you agree to Tingopay ?',
                    style: TextStyle(
                        fontFamily: Font.myFont,
                        fontSize: 12,
                        color: MyColor.mtext)),
              ),
            ),
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const Privacy(),)),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17.0, vertical: 2),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Terms and condition',
                          style: TextStyle(
                              fontFamily: Font.myFont,
                              fontSize: 10,
                              color: MyColor.primaryColor)),
                      TextSpan(
                          text: ' and ',
                          style: TextStyle(
                              fontFamily: Font.myFont,
                              fontSize: 10,
                              color: MyColor.mtext)),
                      TextSpan(
                          text: 'Privacy Statement.',
                          style: TextStyle(
                              fontFamily: Font.myFont,
                              fontSize: 10,
                              color: MyColor.primaryColor)),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}




