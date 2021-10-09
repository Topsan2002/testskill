// To parse this JSON data, do
//
//     final dataUser = dataUserFromJson(jsonString);

import 'dart:convert';

List<DataUser> dataUserFromJson(String str) =>
    List<DataUser>.from(json.decode(str).map((x) => DataUser.fromJson(x)));

String dataUserToJson(List<DataUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataUser {
  DataUser({
    required this.id,
    required this.fname,
    required this.lname,
    required this.address,
    required this.email,
    required this.phone,
  });

  String id;
  String fname;
  String lname;
  String address;

  String email;
  String phone;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        address: json["address"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "address": address,
        "email": email,
        "phone": phone,
      };
}
