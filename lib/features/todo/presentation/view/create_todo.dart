import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/presentation/vms/todo_vm.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/widgets/text_field.dart';
import '../vms/create_todo_vm.dart';

class CreateTodo extends StatelessWidget {
  static const route = '/todo';

  const CreateTodo({Key? key, this.id}) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateTodoViewModel(id != null
          ? context.read<TodoViewModel>().todos.elementAt(id!)
          : null),
      child: const _CreateTodoPage(),
    );
  }
}

class _CreateTodoPage extends StatelessWidget {
  const _CreateTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CreateTodoViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(vm.isEditing ? 'Edit Todo' : 'Create Todo'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          IconButton(
            onPressed: () => vm.createOrEditTodo(context),
            icon: Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.horizontalPadding,
          ),
          child: Column(
            children: [
              AppTextFormField(
                controller: TextEditingController(text: vm.todo.title),
                onChanged: (value) => vm.titleOnChange(value ?? ''),
              ),
              const SizedBox(height: Constants.gridSpaceMedium),
              AppTextFormField(
                controller: TextEditingController(text: vm.todo.content),
                onChanged: (value) => vm.contentOnChange(value ?? ''),
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
