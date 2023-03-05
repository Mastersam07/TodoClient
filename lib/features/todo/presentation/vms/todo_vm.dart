import 'package:flutter/material.dart';
import 'package:todo/features/todo/data/models/todo.dart';

enum Status { created, inprogress, completed }

extension StatusName on num {
  Status get status {
    switch (this) {
      case 1:
        return Status.created;
      case 2:
        return Status.inprogress;
      case 3:
        return Status.completed;
      default:
        return Status.created;
    }
  }
}

class TodoViewModel extends ChangeNotifier {
  TodoViewModel() {
    fetchTodos();
  }

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  void fetchTodos() async {
    await Future.delayed(const Duration(seconds: 2));
    _todos = List.generate(
      10,
      (index) => Todo(
        id: index,
        title: 'TODO ${index + 1}',
        content: 'Some todo content at index $index',
        createdAt: DateTime.now(),
        createdBy: 'User',
        status: (index % 3) + 1,
      ),
    );
    notifyListeners();
  }

  void toggleTodo(Todo item) {
    item.status?.status == Status.completed
        ? markTodoAsInComplete(item)
        : markTodoAsComplete(item);
  }

  void markTodoAsComplete(Todo item) {
    _todos.firstWhere((element) => element.id == item.id).status = 3;
    notifyListeners();
  }

  void markTodoAsInComplete(Todo item) {
    _todos.firstWhere((element) => element.id == item.id).status = 1;
    notifyListeners();
  }

  void deleteTodo(Todo item) {
    _todos.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  void createTodo() {
    // TODO: NAVIGATE TO NEW VIEW
  }
}
