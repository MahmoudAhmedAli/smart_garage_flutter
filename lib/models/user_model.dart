class userModel {
  String? id;
  String? email;
  String? name;
  String? phone;

  userModel({
    this.email,
    this.phone,
    this.name,
    this.id,
  });

  userModel.fromjson(Map<dynamic, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> tomap() {
    return {
      "name": name,
      "id": id,
      "phone": phone,
      "email": email,
    };
  }
}
