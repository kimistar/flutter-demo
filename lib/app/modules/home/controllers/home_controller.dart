import 'package:demo/app/data/models/auth/login_model.dart';
import 'package:demo/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var tooltip = 'Click to connect VPN'.obs;
  var color = Colors.grey.obs;
  var connected = false.obs;

  late User? loginUser;

  @override
  void onInit() {
    super.onInit();

    final user = GetStorage().read('login_user');
    loginUser = user != null ? User.fromJson(user) : null;

    // if (Get.arguments != null) {
    //   Map<String, User?> args = Get.arguments;
    //   print(args['login_user']?.email);
    // }
  }

  void go() {
    if (!connected.value) {
      connected.value = true;
      tooltip.value = 'connected';
      color.value = Colors.green;
    } else {
      connected.value = false;
      tooltip.value = 'Click to connect VPN';
      color.value = Colors.grey;
    }
  }

  void logout() {
    final box = GetStorage();
    box.remove("access_token");
    box.remove("login_email");
    Get.offAllNamed(Routes.LOGIN);
  }
}
