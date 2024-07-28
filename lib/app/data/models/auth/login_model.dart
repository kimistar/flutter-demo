import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginRequest {
  LoginRequest({
    required this.userName,
    required this.password,
    this.type = 'account',
  });

  @JsonKey(name: 'user_name')
  String userName;
  String password;
  String type;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.code,
    this.data,
    this.msg,
  });

  int? code;
  Data? data;
  String? msg;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.accessToken,
    this.user,
  });

  @JsonKey(name: 'access_token')
  String? accessToken;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class User {
  User({
    this.id,
    this.userName,
    this.email,
    this.realName,
    this.avatar,
    this.status,
    this.about,
    this.role,
    this.organization,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  @JsonKey(name: 'user_name')
  String? userName;
  String? email;
  @JsonKey(name: 'real_name')
  String? realName;
  String? avatar;
  int? status;
  String? about;
  String? role;
  String? organization;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
