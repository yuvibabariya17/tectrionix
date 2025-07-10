import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tectrionix/Controllers/companyController.dart';
import 'package:tectrionix/Core/Common/appbar.dart';
import 'package:tectrionix/Core/Constant/assets.dart';
import 'package:tectrionix/Core/Constant/string_const.dart';
import 'package:tectrionix/Core/Themes/color_const.dart';
import 'package:tectrionix/Models/companyModel.dart';
import 'package:tectrionix/Views/Task_2/companyDetailScreen.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  final controller = Get.put(CompanyScreenController());

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
              children: [
                getCommonAppBar(Strings.companyScreenTitle, () {
                  Get.back();
                }),
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(color: black),
                      );
                    }
                    if (controller.companyList.isEmpty) {
                      return Center(
                        child: Text(
                          Strings.noData,
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.companyList.length,
                      itemBuilder: (context, index) {
                        CompanyModel item = controller.companyList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(CompanyDetailScreen(data: item));
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              left: 1.w,
                              right: 1.w,
                              top: 1.h,
                              bottom: 1.h,
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
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.id,
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: black,
                                      radius: 14,
                                      child: Text(
                                        item.id.toString(),
                                        style: const TextStyle(color: white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.company,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          children: [
                                            Text(
                                              item.name,
                                              style: TextStyle(fontSize: 15.sp),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
