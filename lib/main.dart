import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/authentication/presentation/views/auth.dart';
import 'package:todo/features/splash/presentation/views/splash.dart';
import 'package:todo/features/todo/presentation/view/create_todo.dart';
import 'package:todo/features/todo/presentation/view/todo_home.dart';

import 'features/authentication/presentation/vms/auth_vm.dart';
import 'features/todo/presentation/vms/todo_vm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
        ChangeNotifierProvider(create: (_) => TodoViewModel()),
      ],
      child: MaterialApp(
        title: 'Todo',
        theme: ThemeData(
          colorSchemeSeed: Colors.orange,
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case SplashScreen.route:
              return MaterialPageRoute(builder: (_) => const SplashScreen());
            case AuthScreen.route:
              return MaterialPageRoute(builder: (_) => const AuthScreen());
            case TodoHome.route:
              return MaterialPageRoute(builder: (_) => const TodoHome());
            case CreateTodo.route:
              final args = settings.arguments as Map<String, dynamic>?;
              return MaterialPageRoute(
                builder: (_) => CreateTodo(id: args?['id'] as int?),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Center(
                    child: Text(
                      '${settings.name} not found',
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
