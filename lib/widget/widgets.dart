import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/svg.dart';
import '../constants/values.dart';
import '../constants/word.dart';

class CustomWidget<Widget> {
  static Row pageDot({size, currentIndex, color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        size,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: AnimatedContainer(
            width: currentIndex == index ? 24 : 10,
            height: 5,
            decoration: BoxDecoration(
                color: currentIndex == index ? color : MyColor.grey,
                borderRadius: BorderRadius.circular(8)),
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }

  static Stack onboard(
    context, {
    String? bgImage,
    String? imageIllustration,
    String? title,
    String? subtitle,
  }) {
    return Stack(
      children: [
        // SizedBox(
        //   height: MediaQuery.of(context).size.height,
        //   width: ScreenSize.width,
        //   child:
        //       // SVG.use(icon: bgImage!, color: MyColor.primaryColor)
        //       Image.asset(
        //     bgImage!,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        Positioned(
          top: MediaQuery.of(context).size.height / 8,
          child: SizedBox(
            width: ScreenSize.width,
            child: Column(
              children: [
                Image.asset(
                  imageIllustration!,
                  scale: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(title!,
                          style: const TextStyle(
                            
                              fontFamily: 'BRFirma',
                              fontSize: 28,
                              color: MyColor.textColor,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16.0),
                        child: Text(subtitle!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'BRFirma',
                                fontSize: 16,
                                color: MyColor.textColor)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static GestureDetector backButton(context, {required onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        child: SVG.use(icon: SVG.back),
      ),
    );
  }

  // static Padding registerProgressBar(int items, currentIndex) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: List.generate(
  //           items,
  //           (index) => Expanded(
  //             child: Stack(
  //               children: [
  //                 Container(
  //                     margin: const EdgeInsets.only(right: 2),
  //                     height: 3,
  //                     width: double.infinity,
  //                     color: index < currentIndex ? MyColor.green : MyColor.grey.shade300,
  //                   ),
  //                   AnimatedContainer(
  //                       color: MyColor.green,
  //                       margin: const EdgeInsets.only(right: 2),
  //                       duration: Duration(milliseconds: 1000),
  //                       width: currentIndex == index ? ScreenSize.width : 0,
  //                       height: 3
  //                     ),
  //               ],
  //             ),
  //           )),
  //     ),
  //   );
  // }
  static Stack registerProgressBar(currentIndex, index) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 2),
          height: 3,
          width: double.infinity,
          color: currentIndex <= index ? MyColor.green : MyColor.grey.shade300,
        ),
        // AnimatedContainer(
        //     color: MyColor.green,
        //     margin: const EdgeInsets.only(right: 2),
        //     duration: Duration(milliseconds: 1000),
        //     width: currentIndex == index ? ScreenSize.width : 0,
        //     height: 3
        //   ),
      ],
    );
  }

  static Container textField(
      text, controller, TextInputType type, context, name) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 50,
        maxHeight: 50,
      ),
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          border: Border.all(color: MyColor.grey.withOpacity(.5)),
          borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: ScreenSize.width * .9,
        height: 50,
        child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            keyboardType: type,
            // maxLength: 1,
            validator: (text) {
              if (name == 'referral') return null;

              if (text!.trim().isEmpty) {
                return '$name field is required';
              }

              return null;
            },
            style: TextStyle(
              fontSize: 14,
              fontFamily: Font.myFont,
            ),
            // textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: text,
                hintStyle: TextStyle(
                  color: MyColor.grey.withOpacity(.5),
                ),
                border: InputBorder.none)),
      ),
    );
  }

  static Container passwordTextField(
      text, controller, TextInputType type, context, name,
      {bool? view, show}) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 50,
        maxHeight: 50,
      ),
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          border: Border.all(color: MyColor.grey.withOpacity(.5)),
          borderRadius: BorderRadius.circular(8)),
      width: ScreenSize.width * .9,
      height: 50,
      child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: view!,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (text) {
            if (text!.trim().isEmpty) {
              return '$name field is required';
            }
            return null;
          },
          style: TextStyle(
            fontSize: 14,
            fontFamily: Font.myFont,
          ),
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize:12),
              suffixIcon: GestureDetector(
                  onTap: () => show(),
                  child: Icon(view
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded)),
              hintText: text,
              hintStyle: TextStyle(
                color: MyColor.grey.withOpacity(.5),
              ),
              border: InputBorder.none)),
    );
  }
}
