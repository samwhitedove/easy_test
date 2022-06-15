
import 'package:flutter/material.dart';
import 'package:test_app/constants/values.dart';
import 'package:test_app/widget/widgets.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {

  goBack(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomWidget.backButton(context, onTap: ()=> goBack()),
            SizedBox(height: ScreenSize.height * .1,),
            Text('')
          ],
        ),
      )
    );
  }
}