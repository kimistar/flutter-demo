import 'dart:convert';

import "package:flutter/services.dart";
import 'package:yaml/yaml.dart';

late Env env;

class Env {
  final String appEnv;
  final String appDomain;

  Env({
    required this.appEnv,
    required this.appDomain,
  });

  factory Env.fromJson(Map<String, dynamic> json) => Env(
        appEnv: json["app_env"],
        appDomain: json["app_domain"],
      );

  static init() async {
    const appEnv = String.fromEnvironment('APP_ENV');
    final conf = await rootBundle.loadString('env.$appEnv.yaml');
    final mapData = loadYaml(conf);
    env = Env.fromJson(json.decode(json.encode(mapData)));
  }
}
