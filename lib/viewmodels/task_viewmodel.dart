import 'package:flutter/material.dart';

import '../models/task.dart';
import '../repositories/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository repository = TaskRepository();

  List<Task> tasks = [];

  bool isLoading = false;
  String? errorMessage;

  Future<void> loadTasks() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      tasks = await repository.getTasks();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = "Une erreur est survenue";
      notifyListeners();
    }
  }

  void addTask(String title) {
    tasks.add(
      Task(
        id: tasks.length + 1,
        title: title,
      ),
    );

    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTask(int index) {
    tasks[index].completed = !tasks[index].completed;
    notifyListeners();
  }
}