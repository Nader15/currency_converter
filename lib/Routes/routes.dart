import 'package:currency_converter/View/Screens/Splash_Screen/splash_screen.dart';
import 'package:get/get.dart';

import '../Logic/binding/home_binding.dart';
import '../View/Screens/Home_Screen/home_screen.dart';

class AppRoutes {
  //initialRoute
  static const homeScreen = Routes.homeScreen;
  static const splashScreen = Routes.splashScreen;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding()
    ),
  ];
}

class Routes {
  static const splashScreen = '/splashScreen';
  static const homeScreen = '/homeScreen';

}
