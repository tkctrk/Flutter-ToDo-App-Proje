import 'package:flutter_todo_app_project/constants/tasktype.dart';

class Task {
  final String title;
  final String description;
  bool isCompleted;
  final TaskType type;

  Task({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.type,
  });
}
