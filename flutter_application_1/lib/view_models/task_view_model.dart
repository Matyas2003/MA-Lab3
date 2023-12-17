import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/task_repository.dart';
import 'package:flutter_application_1/models/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();
  List<Task> _tasks = [];

  // Use this property to get the tasks in a synchronous manner
  List<Task> get tasks => _tasks;
  
  TaskViewModel() {
    fetchTasks();
  }
  // Fetch tasks asynchronously
  Future<void> fetchTasks() async {
    _tasks = await _repository.getTasks();
    notifyListeners(); // Notify listeners when changes occur
  }

  void addTask(Task task) {
    _repository.addTask(task);
    fetchTasks(); // Fetch tasks after adding a new one
  }

  void updateTask(Task updatedTask) {
    _repository.updateTask(updatedTask);
    fetchTasks(); // Fetch tasks after updating
  }

  void deleteTask(int taskId) {
    _repository.deleteTask(taskId);
    fetchTasks(); // Fetch tasks after deleting
  }
}
