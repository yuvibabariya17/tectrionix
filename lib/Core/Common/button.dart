import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:tectrionix/Core/Themes/color_const.dart';

getFormButton(String btnText, Function callback) {
  return GestureDetector(
    onTap: () {
      callback();
    },
    child: Container(
      width: double.infinity / 2,
      height: 6.h,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(btnText, style: TextStyle(fontSize: 15.sp, color: white)),
      ),
    ),
  );
}
