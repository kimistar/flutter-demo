import 'package:demo/app/data/models/auth/login_model.dart';
import 'package:demo/app/data/providers/base_provider.dart';

class LoginProvider extends BaseProvider {
  Future<LoginResponse?> login(LoginRequest data) async {
    var res = await post("/open/login", data.toJson());
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
    return null;
  }
}
