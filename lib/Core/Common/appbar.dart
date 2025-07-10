// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tectrionix/Core/Constant/assets.dart';
import 'package:tectrionix/Core/Themes/color_const.dart';
import 'package:tectrionix/Core/Themes/font_const.dart';

getCommonAppBar(title, Function? callback) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      commonBackPress(callback),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: gilroySemiBold,
                  color: black,
                  fontWeight: FontWeight.w700,
                  fontSize: 17.5.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 5.w),
    ],
  );
}

getAppBar(title, Function? callback) {
  return Row(
    children: [
      // commonBackPress(callback),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: gilroySemiBold,
                  color: black,
                  fontWeight: FontWeight.w700,
                  fontSize: 17.5.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

getFilterAppBar(title, Function? callback, {VoidCallback? onFilterTap}) {
  return Row(
    children: [
      commonFilterBackPress(callback),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: gilroySemiBold,
                  color: black,
                  fontWeight: FontWeight.w700,
                  fontSize: 17.5.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: onFilterTap,
        child: Container(
          height: 4.2.h,
          width: 4.2.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              Asset.filter,
              color: white,
              fit: BoxFit.cover,
              height: 2.h,
            ),
          ),
        ),
      ),
      SizedBox(width: 5.w),
    ],
  );
}

Widget commonBackPress(callback) {
  return GestureDetector(
    onTap: () {
      callback();
    },
    child: Container(
      // padding: const EdgeInsets.all(2),
      child: Icon(Icons.arrow_back_ios_new, size: 2.2.h),
    ),
  );
}

Widget commonFilterBackPress(callback) {
  return Container(
    margin: EdgeInsets.only(left: 4.w),
    child: GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        child: Icon(Icons.arrow_back_ios_new, size: 2.2.h),
      ),
    ),
  );
}
