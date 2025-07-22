import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final formKey2 = GlobalKey<FormState>();

  final TextEditingController emailControllerL = TextEditingController();
  final TextEditingController passwordControllerL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/book3.png',
                  height: 120,
                  width: 120,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Log in to your Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(
                'Welcome back, please enter your details',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Form(
                key: formKey2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email Address'),
                    CustomTextFieldEmail(
                      controller: emailControllerL,
                      hintText: ''.tr,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 16),
                    const Text('Password'),
                    Obx(() {
                      return CustomTextField(
                        controller: passwordControllerL,
                        obscureText: !firebaseServices.isPasswordVisibleL.value,
                        hintText: ''.tr,
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
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() {
                        return Checkbox(
                          value: firebaseServices.loading.value,
                          onChanged: (value) {
                            firebaseServices.loading.value = value!;
                          },
                        );
                      }),
                      const Text('Remember me'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(RoutesName.forgotPassword);
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Obx(() {
                return RoundButton(
                  width: double.infinity,
                  height: 55,
                  title: 'Login'.tr,
                  loading: firebaseServices.loadingLoginL.value,
                  onPress: () {
                    if (formKey2.currentState!.validate()) {
                      firebaseServices.login(
                        email: emailControllerL.text.trim(),
                        password: passwordControllerL.text.trim(),
                      );
                    }
                  },
                  roundButton: Colors.blueAccent,
                  textColor: AppColor.blackColor,
                );
              }),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 16),
              // Obx(() {
              //   return RoundButton2(
              //     width: 60,
              //     height: 60,
              //     loading: firebaseServices.loadingGoogleL.value,
              //     title: '',
              //     onPress: () async {
              //       await firebaseServices.loginWithGoogle(isRegistration: false);
              //     },
              //     textColor: AppColor.blackColor,
              //     buttonColor2: AppColor.whiteColor,
              //     child: Image.asset(
              //       'assets/images/google1.png',
              //       width: 30,
              //       height: 30,
              //     ),
              //   );
              // }),
              Obx(() {
                return RoundButton2(
                  width: 60,
                  height: 60,
                  loading: firebaseServices.loadingGoogleL.value,
                  title: '',
                  onPress: () async {
                    await firebaseServices.loginWithGoogle(isRegistration: false);
                  },
                  textColor: AppColor.blackColor,
                  buttonColor2: AppColor.whiteColor,
                  child: Image.asset(
                    'assets/images/google1.png',
                    width: 30,
                    height: 30,
                  ),
                );
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?".tr),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RoutesName.registrationScreen);
                    },
                    child: const Text(
                      ' Signup',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required".tr;
    }
    final emailRegex = RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$');
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
