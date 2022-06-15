import 'package:flutter/material.dart';

class Functions {
  static void changePage(index, currentIndex, controller) {
    debugPrint('ddddddddddddd');
    currentIndex = index.toDouble();
    controller.animateToPage(currentIndex.toInt(),
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  static void hideKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }
  

static bool showPassword(context, show) {
  print(show);
  context.findRootAncestorStateOfType()!.setState(() {
    show = !show;
  print(show);

  });
  return show;
}
}
