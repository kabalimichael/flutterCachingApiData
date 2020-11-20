import 'dart:convert';

ApiResponse apoResponseFromJson(String str) =>
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
      ad: Ad.fromJson(json['ad']));

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "ad": ad.toJson(),
      };
}

class Ad {
  String company;
  String url;
  String text;
  Ad({this.company, this.url, this.text});

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        company: json['company'],
        url: json['url'],
        text: json['text'],
      );

  Map<String, dynamic> toJson() =>
      {"company": company, "url": url, "text": text};
}

class UserData {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserData({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        avatar: json['avatar'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar
      };
}
