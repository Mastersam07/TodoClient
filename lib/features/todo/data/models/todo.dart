class Todo {
  int? id;
  DateTime? createdAt;
  String? title;
  String? content;
  num? status;
  String? createdBy;

  Todo(
      {this.id,
      this.createdAt,
      this.title,
      this.content,
      this.status,
      this.createdBy});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = DateTime.parse(json['createdAt']);
    title = json['title'];
    content = json['content'];
    status = num.tryParse(json['status']);
    createdBy = json['created_by'];
  }
}
