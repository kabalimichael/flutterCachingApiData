
class Ad {
  // String company;
  String url;
  String text;
  Ad({ this.url, this.text});

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    // company: json['company']??"None",
    url: json['url'],
    text: json['text'],
  );

  Map<String, dynamic> toJson() =>
      {"url": url, "text": text};
}