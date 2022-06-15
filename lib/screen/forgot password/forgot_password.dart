import 'package:flutter/material.dart';
import 'package:test_app/constants/images.dart';
import 'package:test_app/constants/values.dart';
import 'package:test_app/screen/forgot%20password/forgot_password_pin.dart';
import 'package:test_app/screen/registration/register_page.dart';
import 'package:test_app/widget/widgets.dart';

import '../../constants/colors.dart';
import '../../constants/word.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
        body: SafeArea(
      child: Column(children: [
        Row(
          children: [
            CustomWidget.backButton(context, onTap: ()=> Navigator.pop(context)),
          ],
        ),
        SizedBox(
          height: ScreenSize.height * .06
        ),
        Image.asset(Images.key, scale: 4,),
        SizedBox(
          height: ScreenSize.height * .05,
        ),
        Text(
          'Forgot password',
          style: TextStyle(
              fontSize: 28,
              color: MyColor.text,
              fontFamily: Font.myFont,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            'Please enter the Email ID/Mobile Number associated with your account',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                color: MyColor.text,
                fontFamily: Font.myFont,
                fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(
          height: ScreenSize.height * .07,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text("Email ID/Mobile Number",
                  style: TextStyle(
                      fontSize: 12,
                      color: MyColor.grey,
                      fontFamily: Font.myFont,
                      fontWeight: FontWeight.w300)),
            ),
            CustomWidget.textField("Email/Phone", emailController,
                TextInputType.emailAddress, context, 'email'),
          ],
        ),
        
        SizedBox(
          height: ScreenSize.height * .1,
        ),
        SizedBox(
            width: ScreenSize.width * .9,
            height: 50,
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ForgotPasswordPinScreen()))),
                child: Text('Next',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyColor.white,
                        fontFamily: Font.myFont,
                        fontWeight: FontWeight.w600)))),
      ]),
    ));
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
