import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:tectrionix/Core/Themes/color_const.dart';

class Common {
  void transparentStatusbar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
