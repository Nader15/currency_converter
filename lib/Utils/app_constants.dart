import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AppConstants {

  static const String apiUrl = "http://zariexpress.com/";
  static const String AUTH_BACKGROUND = 'assets/images/auth_background.png';
  static const String SPLASH_BACKGROUND = 'assets/images/splash_background.png';
  static const String WHITE_LOGO = 'assets/images/ZARI_EXPRESS_WHITE_LOGO.png';
  static const String ZARI_HORIZON_LOGO = 'assets/images/ZARI_HORIZ_LOGO.png';
  static const String BLACK_LOGO = 'assets/images/ZARI_EXPRESS_BLACK_LOGO.png';
  static double mediaHeight(context) => MediaQuery.of(context).size.height;
  static double mediaWidth(context) => MediaQuery.of(context).size.width;
  static const double widgetsCurve = 5;
}
