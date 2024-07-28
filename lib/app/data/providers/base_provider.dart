import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';
import '../models/response/error_model.dart';
import 'package:demo/env.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = env.appDomain;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}

FutureOr<Request> requestInterceptor(request) async {
  EasyLoading.show(status: 'loading...');
  return request;
}

FutureOr<Response> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();
  if (response.hasError) {
    EasyLoading.showToast("网络异常, 请稍后重试");
    return response;
  }

  var errResponse = ErrorResponse.fromJson(response.body);
  if (errResponse.code != 10000) {
    EasyLoading.showToast(errResponse.msg!);
    return response;
  }

  return response;
}
