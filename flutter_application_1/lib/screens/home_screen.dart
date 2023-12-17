import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/task_create_screen.dart';
import 'package:flutter_application_1/widgets/task_list.dart';
import 'package:flutter_application_1/view_models/task_view_model.dart';

class HomeScreen extends StatelessWidget {
  final TaskViewModel viewModel;

  HomeScreen({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Task App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TaskList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskCreateScreen(viewModel: viewModel)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}