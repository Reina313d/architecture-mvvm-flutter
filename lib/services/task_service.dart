import '../dto/task_dto.dart';

class TaskService {
  Future<List<TaskDto>> fetchTasks() async {
    await Future.delayed(const Duration(seconds: 2));

    // Pour tester l'état Error, décommentez la ligne suivante :
    // throw Exception("Erreur de connexion");

    return [
      TaskDto(
        id: 1,
        title: "Apprendre MVVM",
        completed: false,
      ),
      TaskDto(
        id: 2,
        title: "Faire le rapport",
        completed: true,
      ),
    ];

    // Pour tester l'état Empty, remplacez le return ci-dessus par :
    // return [];
  }
}