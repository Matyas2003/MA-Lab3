import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/database/database.dart';

class TaskRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  // Read operation
  Future<List<Task>> getTasks() async {
    final Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(DatabaseHelper.tableName);

    return List.generate(maps.length, (index) {
      return Task(
        id: maps[index]['id'],
        title: maps[index]['title'],
        description: maps[index]['description'],
        dueDate: DateTime.parse(maps[index]['dueDate']),
        priority: maps[index]['priority'],
        status: maps[index]['status'],
      );
    });
  }

  // Create operation
  Future<void> addTask(Task task) async {
    final Database db = await _databaseHelper.database;

    await db.insert(
      DatabaseHelper.tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update operation
  Future<void> updateTask(Task updatedTask) async {
    final Database db = await _databaseHelper.database;

    await db.update(
      DatabaseHelper.tableName,
      updatedTask.toMap(),
      where: 'id = ?',
      whereArgs: [updatedTask.id],
    );
  }

  // Delete operation
  Future<void> deleteTask(int taskId) async {
    final Database db = await _databaseHelper.database;

    await db.delete(
      DatabaseHelper.tableName,
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }
}