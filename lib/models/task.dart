class Task {
  final int id;
  final String title;
  bool completed;

  Task({
    required this.id,
    required this.title,
    this.completed = false,
  });
}