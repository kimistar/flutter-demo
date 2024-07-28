

import 'package:demo/app/data/providers/auth/login_provider.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginProvider());
  }
}