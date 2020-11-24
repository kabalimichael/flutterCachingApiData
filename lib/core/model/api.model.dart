import 'dart:convert';

import 'package:flutter_caching_api_data/core/model/ad.model.dart';
import 'package:flutter_caching_api_data/core/model/userdata.model.dart';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<UserData> data;
  Ad ad;

  ApiResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.ad,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: List<UserData>.from(json['data'].map((x) => UserData.fromJson(x))),
      ad: Ad.fromJson(json['support']));

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "ad": ad.toJson(),
      };
}
