import 'package:get/get.dart';
import '../viewModal/firebase_services/firebase_services.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseServices(), fenix: true);
  }
}
