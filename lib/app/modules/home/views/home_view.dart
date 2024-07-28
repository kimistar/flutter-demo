import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("VS VPN")),
      body: Obx(() => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    controller.go();
                  },
                  icon: const Icon(Icons.star),
                  iconSize: 100,
                  color: controller.color.value,
                ),
                const SizedBox(height: 10),
                Text(
                  controller.tooltip.value,
                  style: TextStyle(
                    fontSize: 17,
                    color: controller.color.value,
                  ),
                )
              ],
            ),
          )),
      drawer: Drawer(
        child: ListView(
          children: [
           const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/gopher.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(""),
              ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(controller.loginUser?.email ?? ''),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.logout),
              ),
              title: const Text("退出登录"),
              onTap: () {
                controller.logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
