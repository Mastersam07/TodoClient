import 'package:flutter/material.dart';
import 'package:todo/features/authentication/presentation/views/auth.dart';
import 'package:todo/features/splash/presentation/views/splash.dart';
import 'package:todo/features/todo/presentation/view/todo_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
