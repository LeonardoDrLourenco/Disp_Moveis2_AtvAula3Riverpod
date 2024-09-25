import 'package:flutter_riverpod/flutter_riverpod.dart';

// Gerencia a lista de tarefas
class TaskNotifier extends StateNotifier<List<String>> {
  TaskNotifier() : super([]);

  void addTask(String task) {
    state = [...state, task]; // Adiciona nova tarefa à lista
  }

  void removeTask(int index) {
    state = List.from(state)..removeAt(index); // Remove tarefa da lista
  }
}

// Provider para o gerenciador de tarefas
final taskProvider = StateNotifierProvider<TaskNotifier, List<String>>((ref) {
  return TaskNotifier();
});
