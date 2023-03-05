import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/presentation/view/create_todo.dart';
import 'package:todo/features/todo/presentation/vms/todo_vm.dart';
import 'package:todo/features/todo/presentation/widgets/todo_card.dart';
import 'package:todo/shared/constants.dart';

class TodoHome extends StatelessWidget {
  static const route = '/todo-home';

  const TodoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TodoViewModel>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Your Todos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(CreateTodo.route),
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
        itemBuilder: (_, index) {
          final todo = vm.todos.elementAt(index);
          return TodoCard(
            title: todo.title ?? '',
            description: todo.content ?? '',
            isCompleted: todo.status?.status == Status.completed,
            toggleStatus: () => vm.toggleTodo(todo),
            onTap: () => Navigator.of(context)
                .pushNamed(CreateTodo.route, arguments: {'id': todo.id}),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 4),
        itemCount: vm.todos.length,
      ),
    );
  }
}
