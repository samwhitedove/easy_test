import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/word.dart';
import '/constants/images.dart';
import '/constants/values.dart';
import '/screen/forgot%20password/forgot_password.dart';
import '/screen/registration/register_page.dart';
import '/widget/widgets.dart';


class SetNewPinScreen extends StatefulWidget {
  const SetNewPinScreen({Key? key}) : super(key: key);

  @override
  State<SetNewPinScreen> createState() => _SetNewPinScreenState();
}

class _SetNewPinScreenState extends State<SetNewPinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Row(
          children: [
            CustomWidget.backButton(context, onTap: () => Navigator.pop(context)),
          ],
        ),
        SizedBox(
          height: ScreenSize.height * .07,
        ),
        Text(
          'Enter New Password',
          style: TextStyle(
              fontSize: 28,
              color: MyColor.text,
              fontFamily: Font.myFont,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenSize.height * .07,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text("New Password",
                  style: TextStyle(
                      fontSize: 12,
                      color: MyColor.grey,
                      fontFamily: Font.myFont,
                      fontWeight: FontWeight.w300)),
            ),
            CustomWidget.passwordTextField("Email", emailController,
                TextInputType.emailAddress, context, 'email', view: false, show: true,),
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
              child: Text("Confirm Password",
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

            ],
          ),
        ),
        SizedBox(
          height: ScreenSize.height * .1,
        ),
        SizedBox(
            width: ScreenSize.width * .9,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                child: Text('Submit',
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
