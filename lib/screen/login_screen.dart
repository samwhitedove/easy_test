import 'package:flutter/material.dart';
import 'package:test_app/constants/images.dart';
import 'package:test_app/constants/values.dart';
import 'package:test_app/screen/forgot%20password/forgot_password.dart';
import 'package:test_app/screen/home.dart';
import 'package:test_app/screen/registration/register_page.dart';
import 'package:test_app/widget/widgets.dart';

import '../constants/colors.dart';
import '../constants/word.dart';
import 'forgot password/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Row(
          children: [
            CustomWidget.backButton(context, onTap: ()=> Navigator.pop(context)),
          ],
        ),
        SizedBox(
          height: ScreenSize.height * .15,
        ),
        Text(
          Word.welcome,
          style: TextStyle(
              fontSize: 28,
              color: MyColor.text,
              fontFamily: Font.myFont,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Word.welcomeSub,
                style: TextStyle(
                    fontSize: 16,
                    color: MyColor.text,
                    fontFamily: Font.myFont,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(Images.champagne, scale: 5),
              )
            ],
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
            CustomWidget.textField("Email", emailController,
                TextInputType.emailAddress, context, 'email'),
          ],
        ),
        SizedBox(
          height: ScreenSize.height * .02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text("Password",
                  style: TextStyle(
                      fontSize: 12,
                      color: MyColor.grey,
                      fontFamily: Font.myFont,
                      fontWeight: FontWeight.w300)),
            ),
            CustomWidget.passwordTextField("*******", passwordController,
                TextInputType.text, context, 'Password',
                view: false, show: true),
          ],
        ),
        SizedBox(
          height: ScreenSize.height * .01,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text("Forgot Password? ",
                    style: TextStyle(
                        fontSize: 12,
                        color: MyColor.grey,
                        fontFamily: Font.myFont,
                        fontWeight: FontWeight.w300)),
              ),
              GestureDetector(
                onTap: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ForgotPasswordScreen()))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text("Recover Password",
                      style: TextStyle(
                          fontSize: 12,
                          color: MyColor.primaryColor,
                          fontFamily: Font.myFont,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: ScreenSize.height * .1,
        ),
        Container(
            width: ScreenSize.width * .9,
            height: 50,
            child: ElevatedButton(
                onPressed: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>  const Home(title: "",)))),
                child: Text('Login',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyColor.white,
                        fontFamily: Font.myFont,
                        fontWeight: FontWeight.w600)))),
        SizedBox(
          height: ScreenSize.height * .01,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text("Don’t have an account?",
                    style: TextStyle(
                        fontSize: 12,
                        color: MyColor.grey,
                        fontFamily: Font.myFont,
                        fontWeight: FontWeight.w300)),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Register()))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(" Sign Up",
                      style: TextStyle(
                          fontSize: 12,
                          color: MyColor.primaryColor,
                          fontFamily: Font.myFont,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
