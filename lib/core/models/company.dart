class Companies {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? address;
  String? logoPath;
  String? contactPerson;
  int? isActive;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;

  Companies(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.logoPath,
      this.contactPerson,
      this.isActive,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    logoPath = json['logo_path'];
    contactPerson = json['contact_person'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['logo_path'] = logoPath;
    data['contact_person'] = contactPerson;
    data['is_active'] = isActive;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
