import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../resources/routes/routes_name.dart';

class FirebaseServices extends GetxController{
  final FirebaseAuth auth = FirebaseAuth.instance;

//:::::::>> LOADING FUNCTIONALITY <<:::::::::

  final loadingLoginL = false.obs;
  final loadingGoogleL = false.obs;
  final loadingFacebook = false.obs;
  final loadingRegistration = false.obs;
  RxBool loadingGoogleRegistration = false.obs;
  RxBool loading = false.obs;





//:::::::::::>> password visibility section <<::::::::::::::

//-------> For Registration <---------
  final isPasswordVisibleR = false.obs;
  final isPasswordVisibleRE = false.obs;
  void togglePasswordVisibility() {
    isPasswordVisibleR.value = !isPasswordVisibleR.value;
  }
  void toggleConfirmPasswordVisibility() {
    isPasswordVisibleRE.value = !isPasswordVisibleRE.value;
  }
//-------> For Login <---------
  final isPasswordVisibleL = false.obs;
  void togglePasswordVisibilityL() {
    isPasswordVisibleL.value = !isPasswordVisibleL.value;
  }



  //:::::::::::>>LOGIN, REGISTRATION and  GOOGLE FUNCTIONALITY<<::::::::::::

  Future<void>  registration({required String email, required String password})async{
    loadingRegistration.value = true;
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.snackbar("Successfully".tr, 'Registration Completed'.tr);
      print("User Register : ${userCredential.user!.uid}");
      Get.offAllNamed(RoutesName.homeScreen);
    }catch(e){
      Get.snackbar('Error'.tr, e.toString());
      print("error : $e");
    }finally{
      loadingRegistration.value = false;
    }
  }

  Future<void>  login({required String email, required String password})async{
    loadingLoginL.value = true;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.snackbar("Successfully".tr, 'Login Completed'.tr);
      print("User Login : ${userCredential.user!.uid}");
      Get.offAllNamed(RoutesName.homeScreen);
    }catch(e){
      Get.snackbar('Error'.tr, e.toString());
      print("Error : $e");
    }finally{
      loadingLoginL.value = false;
    }
  }

  // Future<UserCredential?> loginWithGoogle() async {
  //   loadingGoogleRegistration.value = true; // Start loading
  //   try {
  //     final googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) {
  //       Get.snackbar('Cancelled', 'Google sign-in was cancelled');
  //       return null;
  //     }
  //
  //     final googleAuth = await googleUser.authentication;
  //
  //     final cred = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken,
  //       accessToken: googleAuth.accessToken,
  //     );
  //
  //     final result = await auth.signInWithCredential(cred);
  //
  //     Get.snackbar("Success", "Google Sign-in completed");
  //     Get.offAllNamed(RoutesName.homeScreen);
  //     return result;
  //   } catch (e) {
  //     Get.snackbar("Error", "Google Sign-in failed: $e");
  //     print("Google login error: $e");
  //     return null;
  //   } finally {
  //     loadingGoogleRegistration.value = false; // Stop loading
  //   }
  // }

  Future<UserCredential?> loginWithGoogle({bool isRegistration = false}) async {
    if (isRegistration) {
      loadingGoogleRegistration.value = true;
    } else {
      loadingGoogleL.value = true;
    }

    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        Get.snackbar('Cancelled'.tr, 'Google sign-in was cancelled'.tr);
        return null;
      }

      final googleAuth = await googleUser.authentication;

      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final result = await auth.signInWithCredential(cred);

      Get.snackbar("Success".tr, "Google Sign-in completed".tr);
      Get.offAllNamed(RoutesName.homeScreen);
      return result;
    } catch (e) {
      Get.snackbar("Error".tr, "Google Sign-in failed: $e".tr);
      print("Google login error: $e");
      return null;
    } finally {
      if (isRegistration) {
        loadingGoogleRegistration.value = false;
      } else {
        loadingGoogleL.value = false;
      }
    }
  }




}