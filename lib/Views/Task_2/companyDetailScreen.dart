// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tectrionix/Core/Common/appbar.dart';
import 'package:tectrionix/Core/Constant/assets.dart';
import 'package:tectrionix/Core/Constant/string_const.dart';
import 'package:tectrionix/Core/Themes/color_const.dart';
import 'package:tectrionix/Core/Themes/font_const.dart';
import 'package:tectrionix/Models/companyModel.dart';

class CompanyDetailScreen extends StatelessWidget {
  final CompanyModel data;

  const CompanyDetailScreen({super.key, required this.data});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: getCommonAppBar(Strings.companyDetailScreenTitle, () {
                    Get.back();
                  }),
                ),
                FadeInLeft(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      left: 1.w,
                      right: 1.w,
                      top: 2.h,
                      bottom: 2.h,
                    ),
                    padding: EdgeInsets.only(
                      left: 3.w,
                      right: 3.w,
                      top: 2.h,
                      bottom: 2.h,
                    ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: Strings.id,
                            style: TextStyle(
                              fontFamily: gilroyMedium,
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w700,
                              color: black,
                            ),
                            children: [
                              TextSpan(
                                text: data.id.toString(),
                                style: TextStyle(
                                  fontFamily: gilroyMedium,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2.h),
                        RichText(
                          text: TextSpan(
                            text: Strings.company,
                            style: TextStyle(
                              fontFamily: gilroyMedium,
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w700,
                              color: black,
                            ),
                            children: [
                              TextSpan(
                                text: data.name.toString(),
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: gilroyMedium,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2.h),
                        RichText(
                          text: TextSpan(
                            text: Strings.ceo,
                            style: TextStyle(
                              fontFamily: gilroyMedium,
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w700,
                              color: black,
                            ),
                            children: [
                              TextSpan(
                                text: data.ceoName.toString(),
                                style: TextStyle(
                                  fontFamily: gilroyMedium,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2.h),
                        RichText(
                          text: TextSpan(
                            text: Strings.country,
                            style: TextStyle(
                              fontFamily: gilroyMedium,
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w700,
                              color: black,
                            ),
                            children: [
                              TextSpan(
                                text: data.country.toString(),
                                style: TextStyle(
                                  fontFamily: gilroyMedium,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2.h),
                        RichText(
                          text: TextSpan(
                            text: Strings.domain,
                            style: TextStyle(
                              fontFamily: gilroyMedium,
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w700,
                              color: black,
                            ),
                            children: [
                              TextSpan(
                                text: data.domain.toString(),
                                style: TextStyle(
                                  fontFamily: gilroyMedium,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
