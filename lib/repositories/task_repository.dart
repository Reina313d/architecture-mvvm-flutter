import '../models/task.dart';
import '../services/task_service.dart';

class TaskRepository {

  final TaskService service = TaskService();

  Future<List<Task>> getTasks() async {

    final dtos = await service.fetchTasks();

    return dtos.map((e) => e.toModel()).toList();

  }
}