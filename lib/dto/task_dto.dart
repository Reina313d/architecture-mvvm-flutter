import '../models/task.dart';

class TaskDto {
  final int id;
  final String title;
  final bool completed;

  TaskDto({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) {
    return TaskDto(
      id: json["id"],
      title: json["title"],
      completed: json["completed"],
    );
  }

  Task toModel() {
    return Task(
      id: id,
      title: title,
      completed: completed,
    );
  }
}