import 'package:demo/app_binding.dart';
import 'package:demo/env.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();
  await Env.init();
  
  runApp(const App());

  FlutterNativeSplash.remove();
  configLoading();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      builder: EasyLoading.init(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    // ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorWidget = const CupertinoActivityIndicator(
      color: Colors.white,
    )
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..contentPadding = const EdgeInsets.all(20.0)
    // ..progressColor = Colors.black.withOpacity(0.5)
    ..backgroundColor = Colors.black.withOpacity(0.8)
    ..boxShadow = [
      const BoxShadow(color: Colors.transparent),
    ]
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    // ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}
