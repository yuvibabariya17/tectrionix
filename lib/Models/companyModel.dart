// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<CompanyModel> userModelFromJson(String str) => List<CompanyModel>.from(
  json.decode(str).map((x) => CompanyModel.fromJson(x)),
);

String userModelToJson(List<CompanyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompanyModel {
  int id;
  String name;
  String address;
  String zip;
  String country;
  int employeeCount;
  Industry industry;
  int marketCap;
  String domain;
  String logo;
  String ceoName;

  CompanyModel({
    required this.id,
    required this.name,
    required this.address,
    required this.zip,
    required this.country,
    required this.employeeCount,
    required this.industry,
    required this.marketCap,
    required this.domain,
    required this.logo,
    required this.ceoName,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    zip: json["zip"],
    country: json["country"],
    employeeCount: json["employeeCount"],
    industry: industryValues.map[json["industry"]]!,
    marketCap: json["marketCap"],
    domain: json["domain"],
    logo: json["logo"],
    ceoName: json["ceoName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "zip": zip,
    "country": country,
    "employeeCount": employeeCount,
    "industry": industryValues.reverse[industry],
    "marketCap": marketCap,
    "domain": domain,
    "logo": logo,
    "ceoName": ceoName,
  };
}

enum Industry { TECHNOLOGY }

final industryValues = EnumValues({"Technology": Industry.TECHNOLOGY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
