import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_models/task_view_model.dart';
import 'package:flutter_application_1/models/task_model.dart';

class TaskUpdateScreen extends StatefulWidget {
  final TaskViewModel viewModel;
  final Task task;

  TaskUpdateScreen({required this.viewModel, required this.task});

  @override
  _TaskUpdateScreenState createState() => _TaskUpdateScreenState();
}

class _TaskUpdateScreenState extends State<TaskUpdateScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dueDateController;
  late TextEditingController priorityController;
  late TextEditingController statusController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(text: widget.task.description);
    dueDateController = TextEditingController(text: widget.task.dueDate.toString());
    priorityController = TextEditingController(text: widget.task.priority);
    statusController = TextEditingController(text: widget.task.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: dueDateController,
                decoration: InputDecoration(labelText: 'Due Date'),
              ),
              TextFormField(
                controller: priorityController,
                decoration: InputDecoration(labelText: 'Priority'),
              ),
              TextFormField(
                controller: statusController,
                decoration: InputDecoration(labelText: 'Status'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  try {
                    Task updatedTask = Task(
                      id: widget.task.id,
                      title: titleController.text,
                      description: descriptionController.text,
                      dueDate: DateTime.parse(dueDateController.text),
                      priority: priorityController.text,
                      status: statusController.text,
                    );

                    widget.viewModel.updateTask(updatedTask);
                    Navigator.pop(context); // Navigate back to the home screen
                  } catch (e) {
                    // Handle validation error
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Validation Error'),
                          content: Text(e.toString()),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Update Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

