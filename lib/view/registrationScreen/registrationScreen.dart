import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../resources/Colors/colors.dart';
import '../../resources/constants/customTextFieldEmail.dart';
import '../../resources/constants/customTextFieldName.dart';
import '../../resources/constants/customTextFieldPassword.dart';
import '../../resources/round_button/roundButton.dart';
import '../../resources/round_button/roundButton2.dart';
import '../../resources/routes/routes_name.dart';
import '../../viewModal/firebase_services/firebase_services.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

final FirebaseServices firebaseServices = Get.find<FirebaseServices>();

class _RegistrationScreenState extends State<RegistrationScreen> {
  final  formKey1 = GlobalKey<FormState>();
  //For Registration
  final TextEditingController emailControllerR = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordControllerR = TextEditingController();
  final TextEditingController confirmPasswordR = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControllerR.dispose();
    passwordControllerR.dispose();
    confirmPasswordR.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed(RoutesName.loginScreen);
          },
          icon: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                Center(
                  child: Image.asset(
                    'assets/images/book3.png',
                    height: size.height * 0.12,
                    width: size.width * 0.3,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Create an Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width * 0.06),
                  ),
                ),
                Center(child: Text('Sign up now to get started.')),

                const SizedBox(height: 20),
                Text('Full Name'),
                CustomTextFieldName(
                  controller: nameController,
                  hintText: '',
                  validator: validateName,
                ),

                Text('Email Address'),
                CustomTextFieldEmail(
                  controller: emailControllerR,
                  hintText: '',
                  validator: validateEmail,
                ),

                Text('Password'),
                Obx(() {
                  return CustomTextField(
                    controller: passwordControllerR,
                    obscureText: !firebaseServices.isPasswordVisibleR.value,
                    hintText: '',
                    suffixIcon: IconButton(
                      onPressed: firebaseServices.togglePasswordVisibility,
                      icon: Icon(firebaseServices.isPasswordVisibleR.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    validator: validatePassword,
                  );
                }),

                Text('Confirm Password'),
                Obx(() {
                  return CustomTextField(
                    controller: confirmPasswordR,
                    obscureText: !firebaseServices.isPasswordVisibleRE.value,
                    hintText: '',
                    suffixIcon: IconButton(
                      onPressed: firebaseServices.toggleConfirmPasswordVisibility,
                      icon: Icon(firebaseServices.isPasswordVisibleRE.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    validator: validateConfirmPassword,
                  );
                }),

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
                    const Text('I agree to the '),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Terms of Service',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return RoundButton(
                    width: double.infinity,
                    height: 55,
                    loading: firebaseServices.loadingRegistration.value,
                    title: 'Get Started',
                    onPress: () {
                      if (formKey1.currentState!.validate()) {
                        firebaseServices.registration(
                          email: emailControllerR.text.trim(),
                          password: passwordControllerR.text,
                        );
                      }
                    },
                    roundButton: Colors.blueAccent,
                    textColor: AppColor.blackColor,
                  );
                }),

                const SizedBox(height: 15),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("OR"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 16),
                Center(
                  child: Obx(() {
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () => Get.toNamed(RoutesName.loginScreen),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
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
  String? validateConfirmPassword(String? value){
    String password = passwordControllerR.text.trim();
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required'.tr;
    }
    if (value != password) {
      // Show Snackbar for mismatch
      Future.delayed(Duration.zero, () {
        Get.snackbar(
            "Error".tr,
            "Passwords do not match".tr,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white
        );
      });
      return "Passwords do not match".tr;
    }
    return null;
  }
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required".tr;
    }
    if (value.trim().length < 3) {
      return "Name must be at least 3 characters".tr;
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim())) {
      return "Only alphabets and spaces are allowed".tr;
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
