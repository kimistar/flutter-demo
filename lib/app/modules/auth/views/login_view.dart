import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: _buildLoginView(context, controller),
    );
  }
}

Widget _buildLoginView(BuildContext context, LoginController controller) {
  return Scaffold(
      body: Column(children: [
    Container(
      padding: const EdgeInsets.only(top: 100.0, bottom: 10.0),
      child: const Text(
        'LDAP',
        style:
            TextStyle(color: Color.fromARGB(255, 53, 53, 53), fontSize: 50.0),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: controller.loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 240, 240, 240),
                          width: 1.0))),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: '邮箱',
                  labelStyle: const TextStyle(
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 93, 93, 93),
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Color.fromARGB(255, 126, 126, 126),
                    ),
                    onPressed: () {
                      controller.emailController.clear();
                    },
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  return controller.emailValidator(v);
                },
                controller: controller.emailController,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 240, 240, 240),
                          width: 1.0))),
              child: Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordObscure.value,
                  decoration: InputDecoration(
                    labelText: '密码',
                    labelStyle: const TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 93, 93, 93),
                    ),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color.fromARGB(255, 126, 126, 126),
                      ),
                      onPressed: () {
                        controller.passwordObscure();
                      },
                    ),
                  ),
                  validator: (v) {
                    return controller.passwordValidator(v);
                  },
                ),
              ),
            ),
            Obx(
              () => Container(
                height: 45.0,
                margin: const EdgeInsets.only(top: 40.0),
                child: SizedBox.expand(
                  child: ElevatedButton(
                    onPressed: controller.canSubmit.value
                        ? () {
                            controller.login();
                          }
                        : null,
                    child: const Text(
                      '登 录',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ]));
}
