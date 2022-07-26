class Model {
  final String title;
  final List<int> kids;

  Model({required this.title, required this.kids});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json["title"],
      kids:  json["kids"]
    );
  }
}
