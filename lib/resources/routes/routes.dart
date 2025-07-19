import 'package:get/get.dart';
import 'package:smart_tailor/view/chooseLanguageScreen/startScreen.dart';
import '../../authBinding/authBinding.dart';
import '../../view/homeScreen/homeScreen.dart';
import '../../view/loginScreen/loginScreen.dart';
import '../../view/registrationScreen/registrationScreen.dart';
import 'routes_name.dart';
import 'package:smart_tailor/services/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.registrationScreen,
      page: () => RegistrationScreen(),
      binding: AuthBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.chooseLanguage,
      page: () => ChooseLanguageScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
