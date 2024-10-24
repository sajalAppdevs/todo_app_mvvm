import 'package:flutter/material.dart';
import '../models/task.dart';
import '../models/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _taskRepository = TaskRepository();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void loadTasks() {
    _tasks = _taskRepository.getTasks();
    notifyListeners();
  }

  void addTask(String title) {
    final newTask = Task(id: DateTime.now().millisecondsSinceEpoch, title: title);
    _taskRepository.addTask(newTask);
    loadTasks();
  }

  void updateTask(Task task) {
    _taskRepository.updateTask(task);
    loadTasks();
  }

  void deleteTask(Task task) {
    _taskRepository.deleteTask(task);
    loadTasks();
  }

  void toggleTaskCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    updateTask(task);
  }
}
