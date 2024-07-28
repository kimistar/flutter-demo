// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      userName: json['user_name'] as String,
      password: json['password'] as String,
      type: json['type'] as String? ?? 'account',
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'password': instance.password,
      'type': instance.type,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      accessToken: json['access_token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      userName: json['user_name'] as String?,
      email: json['email'] as String?,
      realName: json['real_name'] as String?,
      avatar: json['avatar'] as String?,
      status: json['status'] as int?,
      about: json['about'] as String?,
      role: json['role'] as String?,
      organization: json['organization'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'email': instance.email,
      'real_name': instance.realName,
      'avatar': instance.avatar,
      'status': instance.status,
      'about': instance.about,
      'role': instance.role,
      'organization': instance.organization,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
