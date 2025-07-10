// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tectrionix/Core/Common/appbar.dart';
import 'package:tectrionix/Core/Constant/assets.dart';
import 'package:tectrionix/Core/Constant/string_const.dart';
import 'package:tectrionix/Core/Themes/color_const.dart';
import 'package:tectrionix/Views/Task_1_todo/todoListScreen.dart';
import 'package:tectrionix/Views/Task_2/companyScreen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(Asset.appBg, fit: BoxFit.cover),
        ),
        Scaffold(
          body: Container(
            margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: getAppBar(Strings.taskScreenTitle, () {
                    Get.back();
                  }),
                ),
                SizedBox(height: 2.h),
                GestureDetector(
                  onTap: () {
                    Get.to(TodoListScreen());
                  },
                  child: getContainer(Strings.taskOne, 1),
                ),

                SizedBox(height: 1.h),
                GestureDetector(
                  onTap: () {
                    Get.to(CompanyScreen());
                  },
                  child: getContainer(Strings.taskTwo, 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getContainer(String title, int index) {
    return Container(
      height: 7.h,
      margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
      padding: EdgeInsets.only(left: 3.w, right: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: const Offset(0.2, 0.2),
          ),
        ],
      ),

      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
            ),

            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
