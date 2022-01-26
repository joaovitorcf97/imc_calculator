import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:imc_calculator/model/task.dart';

class TodoController extends ChangeNotifier {
  final List<Task> _items = [];

  List<Task> get items {
    return [...items];
  }

  int get itemsCount {
    return _items.length;
  }

  Task itemByIndex(int index) {
    return _items[index];
  }

  void addTask(String text, bool check) {
    final newTask = Task(
      id: Random().nextDouble().toInt(),
      text: text,
      check: check,
    );

    _items.add(newTask);

    notifyListeners();
  }

  Task removeTaskId(int index) {
    return _items.removeAt(index);
  }
}
