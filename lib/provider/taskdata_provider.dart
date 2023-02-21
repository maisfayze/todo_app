import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  int get count => tasks.length;
  void addTask(String value) {
    tasks.add(Task(title: value));
    notifyListeners();
  }

  void updateTask(Task updatedTask, String newtitle) {
    updatedTask.title = newtitle;
    notifyListeners();
  }

  void removeTask(Task removed) {
    tasks.remove(removed);
    notifyListeners();
  }

  void toggle(Task task) {
    task.toggle();
    notifyListeners();
  }
}
