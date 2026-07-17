import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/task_viewmodel.dart';
import 'widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TaskViewModel>().loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Architecture MVVM"),
        centerTitle: true,
      ),

      body: Builder(
        builder: (_) {
          if (vm.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (vm.errorMessage != null) {
            return Center(
              child: Text(vm.errorMessage!),
            );
          }

          if (vm.tasks.isEmpty) {
            return const Center(
              child: Text(
                "Aucune tâche disponible",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: vm.tasks.length,
            itemBuilder: (context, index) {
              final task = vm.tasks[index];

              return TaskCard(
                task: task,
                onDelete: () => vm.deleteTask(index),
                onToggle: () => vm.toggleTask(index),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text("Nouvelle tâche"),

                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Nom de la tâche",
                  ),
                ),

                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Annuler"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        vm.addTask(controller.text);
                        controller.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Ajouter"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}