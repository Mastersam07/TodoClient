import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/widgets/text_field.dart';
import '../../application/auth_vm.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('💼 TODO', style: TextStyle(fontSize: 48)),
        AppTextFormField(
          label: 'Email',
          hint: 'email@provider.co',
          onChanged: (value) {
            context.read<AuthenticationViewModel>().emailOnChanged(value ?? '');
          },
        ),
        const SizedBox(height: Constants.gridSpaceSmall),
        AppTextFormField(
          label: 'Password',
          hint: '**********',
          suffix: InkWell(
            onTap: context.read<AuthenticationViewModel>().obscurePasswordOnTap,
            child: AnimatedSwitcher(
              duration: const Duration(
                  milliseconds: Constants.shortAnimationDuration),
              child: () {
                if (context.watch<AuthenticationViewModel>().obscurePassword) {
                  return const Icon(
                    Icons.remove_red_eye,
                    key: Key('obscure'),
                  );
                }
                return const Icon(
                  Icons.remove_red_eye_outlined,
                  key: Key('!obscure'),
                );
              }(),
            ),
          ),
          onChanged: (value) {
            context
                .read<AuthenticationViewModel>()
                .passwordOnChanged(value ?? '');
          },
        ),
        const SizedBox(height: Constants.gridSpaceMedium),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.read<AuthenticationViewModel>().signUpOnTap(context);
            },
            child: const Text('Sign In'),
          ),
        ),
      ],
    );
  }
}
