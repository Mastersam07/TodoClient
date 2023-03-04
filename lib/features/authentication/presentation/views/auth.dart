import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/authentication/application/auth_vm.dart';
import 'package:todo/features/authentication/presentation/widgets/sign_in_page.dart';
import 'package:todo/features/authentication/presentation/widgets/sign_up_page.dart';
import 'package:todo/shared/constants.dart';

class AuthScreen extends StatelessWidget {
  static const route = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthenticationViewModel(),
      child: const _AuthPage(),
    );
  }
}

class _AuthPage extends StatelessWidget {
  const _AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.horizontalPadding,
          ),
          child: Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index:
                      context.watch<AuthenticationViewModel>().isSignIn ? 1 : 0,
                  children: const [
                    SignUpPage(),
                    SignInPage(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Constants.gridSpaceMedium),
                child: InkWell(
                  onTap:
                      context.read<AuthenticationViewModel>().signInOptionOnTap,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchOutCurve: Curves.decelerate,
                    switchInCurve: Curves.bounceIn,
                    child: () {
                      if (context.watch<AuthenticationViewModel>().isSignIn) {
                        return const Text(
                          key: Key('sign-up'),
                          'Sign Up?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }
                      return const Text(
                        key: Key('sign-in'),
                        'Sign In?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
