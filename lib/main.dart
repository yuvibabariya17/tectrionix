import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'package:tectrionix/Core/Common/common.dart';
import 'package:tectrionix/Core/Themes/color_const.dart';
import 'package:tectrionix/Core/Themes/font_const.dart';
import 'package:tectrionix/Models/Model.dart';
import 'package:tectrionix/Views/Splash/splashScreen.dart';

void main() async {
  Common().transparentStatusbar();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasksBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            datePickerTheme: DatePickerThemeData(backgroundColor: white),
            fontFamily: gilroyMedium,
            scaffoldBackgroundColor: transparent,
            textSelectionTheme: TextSelectionThemeData(cursorColor: black),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
