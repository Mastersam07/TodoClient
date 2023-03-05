import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/presentation/vms/todo_vm.dart';

import '../../data/models/todo.dart';

class CreateTodoViewModel extends ChangeNotifier {
  Todo _todo = Todo();

  CreateTodoViewModel(Todo? todo) {
    if (todo != null) {
      _isEditing = true;
      _todo = todo;
      notifyListeners();
    }
  }

  Todo get todo => _todo;

  bool get isEditing => _isEditing;
  bool _isEditing = false;

  void titleOnChange(String value) {
    _todo.title = value;
    notifyListeners();
  }

  void contentOnChange(String value) {
    _todo.content = value;
    notifyListeners();
  }

  void createOrEditTodo(BuildContext context) {
    _isEditing ? _completeTodoEdit(context) : _createTodo(context);

    Navigator.of(context).pop();
  }

  void _createTodo(BuildContext context) {
    context.read<TodoViewModel>().createTodo(
          _todo
            ..id = context.read<TodoViewModel>().todos.length
            ..createdAt = DateTime.now()
            ..createdBy = 'User'
            ..status = 1,
        );
  }

  void _completeTodoEdit(BuildContext context) {
    context.read<TodoViewModel>().updateTodo(
          _todo
            ..status = 1
            ..createdAt = DateTime.now(),
        );
  }
}
