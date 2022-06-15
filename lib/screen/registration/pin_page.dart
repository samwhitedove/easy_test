import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/constants/colors.dart';
import 'package:test_app/constants/word.dart';

import '../../constants/values.dart';
import '../../functions/functions.dart';


  Widget pinPage(onTap, BuildContext context){
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
                'Verify Phone Number',
                style: TextStyle(
                    fontFamily: Font.myFont,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: MyColor.text),
              )),
            ),
            Center(
                child: Text(
              'Enter the 4 digit code sent to 08108298990',
              style: TextStyle(
                  fontFamily: Font.myFont,
                  fontSize: 16,
                  color: MyColor.text,
                  fontWeight: FontWeight.w500),
            )),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 8.0, top: ScreenSize.height * .2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textField(context, onTap),
                  Container(height: 2, width: 4, color: MyColor.black),
                  textField(context, onTap),
                  Container(height: 2, width: 4, color: MyColor.black),
                  textField(context, onTap),
                  Container(height: 2, width: 4, color: MyColor.black),
                  textField(context, onTap),
                ],
              ),
            ),
            SizedBox(height: ScreenSize.width * .15),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Haven’t received code after 5 min? ',
                      style: TextStyle(
                        fontFamily: Font.myFont,
                      )),
                  GestureDetector(
                    onTap: null,
                    // () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: ((context) => FullInfoPage()))),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Resend code',
                          style: TextStyle(
                              fontFamily: Font.myFont,
                              color: MyColor.primaryColor)),
                    ),
                  ),
                ],
              ),
            ),
            showLoading ? SizedBox(height: ScreenSize.height * .1) : Container(),
            showLoading ? const Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),) : Container()
          ],
        ),
      ),
    ));
 
  }
  int last = 1;
  bool showLoading = false;    
  Widget textField(BuildContext context, onTap) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        // margin: EdgeInsets.symmetric(horizontal: 2),
        width: 50,
        height: 50,
        child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            enabled: !showLoading,
            onChanged: (text) async {
              if (text.length == 1) {
                last++;
                if(last != 5) FocusScope.of(context).nextFocus();
                if (last == 5) {
                  Functions.hideKeyboard();
                  last = 1;
                  context.findRootAncestorStateOfType()!.setState(() {
                    showLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 3));
                  context.findRootAncestorStateOfType()!.setState(() {
                    showLoading = false;
                  });
                  onTap();
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => FullInfoPage()));
                }
              }
            },
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: MyColor.mtext,
                  fontSize: 22,
                  fontFamily: Font.myFont,
                ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                // hintText: '0',
                hintStyle: TextStyle(color: MyColor.grey.withOpacity(.7)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
      ),
    );
  
}
