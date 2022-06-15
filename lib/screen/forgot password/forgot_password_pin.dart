import 'package:flutter/material.dart';
import 'package:test_app/screen/forgot%20password/set_new_pin.dart';
import 'package:test_app/screen/registration/pin_page.dart';
import 'package:test_app/widget/widgets.dart';

import '../../constants/colors.dart';

class ForgotPasswordPinScreen extends StatefulWidget {
  const ForgotPasswordPinScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPinScreen> createState() => _ForgotPasswordPinScreenState();
}

class _ForgotPasswordPinScreenState extends State<ForgotPasswordPinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.white,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  CustomWidget.backButton(context,
                      onTap: () => Navigator.pop(context)),
                ],
              ),
              Flexible(child: pinPage(()=> Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SetNewPinScreen()))), context))
            ],
          ),
        ));
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
