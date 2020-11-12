class TestModel {
  TestModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  dynamic userId;
  dynamic id;
  String title;
  String body;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
