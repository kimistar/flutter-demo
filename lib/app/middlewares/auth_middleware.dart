import 'package:demo/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // 路由跳转可携带arguments
    final box = GetStorage();
    return box.read("access_token") != null || route == Routes.LOGIN
        ? null
        : const RouteSettings(name: Routes.LOGIN);
  }
}
