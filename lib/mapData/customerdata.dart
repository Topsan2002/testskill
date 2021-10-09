// To parse this JSON data, do
//
//     final dataCustomer = dataCustomerFromJson(jsonString);

import 'dart:convert';

List<DataCustomer> dataCustomerFromJson(String str) => List<DataCustomer>.from(
    json.decode(str).map((x) => DataCustomer.fromJson(x)));

String dataCustomerToJson(List<DataCustomer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataCustomer {
  DataCustomer({
    required this.cusId,
    required this.fname,
    required this.lname,
    required this.phone,
  });

  String cusId;
  String fname;
  String lname;
  String phone;

  factory DataCustomer.fromJson(Map<String, dynamic> json) => DataCustomer(
        cusId: json["cus_id"],
        fname: json["fname"],
        lname: json["lname"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "cus_id": cusId,
        "fname": fname,
        "lname": lname,
        "phone": phone,
      };
}
