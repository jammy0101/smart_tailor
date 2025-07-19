import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../resources/Colors/colors.dart';

import '../../resources/constants/customTextFieldEmail.dart';
import '../../resources/constants/customTextFieldPassword.dart';
import '../../resources/round_button/roundButton.dart';
import '../../resources/round_button/roundButton2.dart';
import '../../resources/routes/routes_name.dart';
import '../../viewModal/firebase_services/firebase_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final FirebaseServices firebaseServices = Get.find<FirebaseServices>();


class _LoginScreenState extends State<LoginScreen> {
  final  formKey2 = GlobalKey<FormState>();
  //For Login
  final TextEditingController emailControllerL = TextEditingController();
  final TextEditingController passwordControllerL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
                child: Row(
                  children: [
                    Text(
                      'WEL'.tr,
                      style: TextStyle(color: AppColor.blackColor, fontSize: 36),
                    ),
                    Text(
                      'COME BACK!'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.blackColor,
                        fontSize: 36,
                        fontFamily: 'SourceSans3',
                        wordSpacing: 2,
                        letterSpacing: 2.3,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFieldEmail(
                      controller: emailControllerL,
                      hintText: 'Enter the email'.tr,
                      validator: validateEmail,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Obx(() {
                        return CustomTextField(
                          controller: passwordControllerL,
                          obscureText: !firebaseServices.isPasswordVisibleL.value,
                          hintText: 'Enter the Password'.tr,
                          suffixIcon: IconButton(
                            onPressed: firebaseServices.togglePasswordVisibilityL,
                            icon: Icon(
                              firebaseServices.isPasswordVisibleL.value
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                          validator: validatePassword,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      //About forgot password
                    },
                    child: Text(
                      'Forgot password'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6,),
              Obx(() {
                return RoundButton(
                  width: 377,
                  height: 60,
                  title: 'Login'.tr,
                  loading: firebaseServices.loadingLoginL.value,
                  onPress: (){
                    if(formKey2.currentState!.validate()){
                      firebaseServices.login(
                        email: emailControllerL.text.trim(),
                        password: passwordControllerL.text.trim(),
                      );
                    }
                  },
                  roundButton: AppColor.blackColor,
                  textColor: AppColor.blackColor,
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Text('or continue'.tr),
              ),
              Obx(() {
                return  RoundButton2(
                  width: 377,
                  height: 60,
                  loading: firebaseServices.loadingGoogleL.value,
                  title: 'Google'.tr,
                  onPress: (){
                    //Google integration
                  },
                  textColor: AppColor.blackColor,
                  buttonColor2: AppColor.blueColor,
                );
              }),
              TextButton(
                onPressed: () {
                  Get.toNamed(RoutesName.registrationScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?".tr,
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColor.blackColor,
                      ),
                    ),
                    Text(
                      'Registration'.tr,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required".tr;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email".tr;
    }
    return null;
  }


  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required".tr;
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters".tr;
    }
    return null;
  }

}
