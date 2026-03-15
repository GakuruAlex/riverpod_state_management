class Todo {
  final String title;
  final int id;
  final bool isCompleted;
  const Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
  });
  Todo copyWith({String? title, int? id, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
