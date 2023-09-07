import 'package:v_cms_app_1/core/models/company.dart';
import 'package:v_cms_app_1/core/models/role.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  int? active;
  int? phone;
  String? apiToken;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  List<Roles>? roles;
  List<Companies>? companies;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.active,
      this.phone,
      this.apiToken,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.roles,
      this.companies});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    active = json['active'];
    phone = json['phone'];
    apiToken = json['api_token'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['active'] = active;
    data['phone'] = phone;
    data['api_token'] = apiToken;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    if (companies != null) {
      data['companies'] = companies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
