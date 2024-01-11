import 'package:flutter/material.dart';
import 'package:tasknew/model/Task.dart';

class Taskproider extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "Go Shopping"),
    Task(name: "get Gift"),
    Task(name: "do homwork"),
  ];

  void addtask(String tas) {
    print(tas);
    tasks.add(Task(name: tas));
    notifyListeners();
  }

  void updatecheck(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task tas) {
    print(tas);
    tasks.remove(tas);
    notifyListeners();
  }
}
