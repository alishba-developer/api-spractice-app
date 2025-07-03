class TodoModel {
  String? id;
  String? title;
  String? description;

  TodoModel({this.id, this.title, this.description});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['title'] = title;
    _data['id'] = id;
    _data['description'] = description;
    return _data;
  }
}
