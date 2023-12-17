class Task {
  int? id;
  String title;
  String description;
  DateTime dueDate;
  String priority;
  String status;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.status,
  }) {
    _validateFields();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'priority': priority,
      'status': status,
    };
  }

  void _validateFields() {
    if (title.isEmpty) {
      throw ArgumentError('Task title cannot be empty');
    }
        if (description.isEmpty) {
      throw ArgumentError('Task description cannot be empty');
    }
        if (priority.isEmpty) {
      throw ArgumentError('Task priority cannot be empty');
    }
        if (status.isEmpty) {
      throw ArgumentError('Task status cannot be empty');
    }
  }
}