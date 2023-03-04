import 'package:flutter/material.dart';
import 'package:todo/features/todo/presentation/widgets/todo_card.dart';
import 'package:todo/shared/constants.dart';

class TodoHome extends StatelessWidget {
  static const route = '/todo-home';

  const TodoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Your Todos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
        child: Column(
          children: [
            TodoCard(
              title: 'My First Todo',
              description:
                  'I set so much stuff on this todo and I hope it works',
            ),
          ],
        ),
      ),
    );
  }
}
