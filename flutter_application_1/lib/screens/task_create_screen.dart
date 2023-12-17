import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_models/task_view_model.dart';
import 'package:flutter_application_1/models/task_model.dart';

class TaskCreateScreen extends StatefulWidget {
  final TaskViewModel viewModel;

  TaskCreateScreen({required this.viewModel});

  @override
  _TaskCreateScreenState createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dueDateController;
  late TextEditingController priorityController;
  late TextEditingController statusController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    dueDateController = TextEditingController();
    priorityController = TextEditingController();
    statusController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
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
                    Task newTask = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      dueDate: DateTime.parse(dueDateController.text),
                      priority: priorityController.text,
                      status: statusController.text,
                    );

                    widget.viewModel.addTask(newTask);
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
                child: Text('Create Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
