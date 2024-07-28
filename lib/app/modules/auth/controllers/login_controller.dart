import 'package:demo/app/data/models/auth/login_model.dart';
import 'package:demo/app/data/providers/auth/login_provider.dart';
import 'package:demo/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  LoginController({
    required this.loginProvider,
  });
  final LoginProvider loginProvider;

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordObscure = true.obs;

  final isEmailValidate = false.obs;
  final isPasswordValidate = false.obs;
  final canSubmit = false.obs;

  @override
  void onInit() {
    super.onInit();

    everAll(
        [isEmailValidate, isPasswordValidate],
        ((callback) => {
              canSubmit.value =
                  isEmailValidate.value && isPasswordValidate.value
            }));

    emailController.addListener(() {
      if (emailValidator(emailController.text) == null) {
        isEmailValidate.value = true;
      } else {
        isEmailValidate.value = false;
      }
    });

    passwordController.addListener(() {
      if (passwordValidator(passwordController.text) == null) {
        isPasswordValidate.value = true;
      } else {
        isPasswordValidate.value = false;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void passwordObscure() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  String? emailValidator(String? email) {
    if (email!.isEmpty) {
      return "邮箱不能为空";
    }
    if (!GetUtils.isEmail(email)) {
      return "无效的邮箱地址";
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return "密码不能为空";
    }
    return null;
  }

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      var res = await loginProvider.login(LoginRequest(
        userName: emailController.text,
        password: passwordController.text,
      ));

      if (res?.code == 10000) {
        final box = GetStorage();
        box.write("access_token", res!.data!.accessToken);
        box.write("login_user", res.data!.user!.toJson());
        Get.offAllNamed(Routes.HOME);
      }
    }
  }
}
