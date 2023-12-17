import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/task_update_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/view_models/task_view_model.dart';
import 'package:flutter_application_1/models/task_model.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, viewModel, child) {
        List<Task> tasks = viewModel.tasks;

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            Task task = tasks[index];

            return ListTile(
              title: Text(task.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: ${task.description}'),
                  Text('Due Date: ${task.dueDate}'),
                  Text('Priority: ${task.priority}'),
                  Text('Status: ${task.status}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskUpdateScreen(
                            viewModel: viewModel,
                            task: task,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, viewModel, task);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  void _showDeleteConfirmationDialog(BuildContext context, TaskViewModel viewModel, Task task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                viewModel.deleteTask(task.id!); // Assuming id is not null
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
