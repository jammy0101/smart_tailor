import 'package:get/get.dart';
import 'package:smart_tailor/resources/Forgot/SuccessScreen.dart';
import 'package:smart_tailor/resources/Forgot/emailSentScreen.dart';
import 'package:smart_tailor/view/chooseLanguageScreen/startScreen.dart';
import 'package:smart_tailor/view/forgotPassword/forgotPassword.dart';
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
    GetPage(
      name: RoutesName.forgotPassword,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.emailSentScreen,
      page: () => EmailSentScreen(),
      binding: AuthBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: RoutesName.resetSuccessScreen,
      page: () => SuccessScreen(),
      binding: AuthBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
