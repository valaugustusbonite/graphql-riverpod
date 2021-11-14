class Todo {
  String id;
  String body;
  String date;

  Todo({
    required this.id,
    required this.body,
    required this.date,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as String? ?? '',
      body: json['body'] as String? ?? '',
      date: json['date'] as String? ?? '',
    );
  }


}