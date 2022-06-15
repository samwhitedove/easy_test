import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVG {
  static GestureDetector use({Color? color, String? icon, double? height, double? width, onTap}) {
    return GestureDetector(onTap: onTap, child: SvgPicture.asset(height: height, width: width, fit: BoxFit.cover, color: color, icon!));
  }

  static const String home = "assets/svg/home.svg";
  static const String payment = "assets/svg/payment.svg";
  static const String transactions = "assets/svg/transactions.svg";
  static const String cards = "assets/svg/card.svg";
  static const String back = "assets/svg/back_arrow.svg";
  static const String bgOne = "assets/svg/bg_onboard_one.svg";
  static const String bgTwo = "assets/svg/bg_onboard_two.svg";
  static const String bgThree = "assets/svg/bg_onboard_three.svg";
  static const String settings = "assets/svg/setting.svg";
}
