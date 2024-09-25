import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_notifier.dart';

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskProvider); // Observa as tarefas
    final taskNotifier = ref.read(taskProvider.notifier); // Acessa o Notifier

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas ' 'To-Do'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return ListTile(
                  title: Text(task),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      taskNotifier.removeTask(index); // Remove tarefa
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onSubmitted: (value) {
                taskNotifier.addTask(value); // Adiciona tarefa
              },
              decoration: InputDecoration(
                labelText: 'Adicione uma Tarefa',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
