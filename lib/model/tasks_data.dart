import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo_app_class/model/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Buy Milk'),
    Task(title: 'Buy bread'),
    Task(title: 'Buy bicycle'),
  ];

  int get tasksCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void toggle(Task task) {
    task.toggleTask();
    notifyListeners();
  }

  void add(String title) {
    // tasks.add(Task(title: title));
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void delete(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
