import 'package:flutter/material.dart';
import 'package:to_do/models/taskModel.dart';
import 'package:to_do/services/firebaseServices.dart';

class TasksProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime dateTime = DateTime.now();
  Future<List<TaskModel>?> getAllTasks() async {
    try {
      List<TaskModel> alltasks = await FirebaseServices.getTasks();
      tasks = alltasks;
      print(tasks.length);
      return tasks;
    } catch (e) {
      print(e);
    }
    return null;
  }

  addTask(TaskModel newTask) {
    try {
      FirebaseServices.addTask(newTask);
    } catch (e) {
      print(e);
    }
  }

  changeSelectedDate(DateTime newDate) {
    dateTime = newDate;
    notifyListeners();
  }
}
