import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../vms/auth_vm.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/widgets/text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AuthenticationViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('💼 TODO', style: TextStyle(fontSize: 48)),
        AppTextFormField(
          label: 'Email',
          hint: 'email@provider.co',
          onChanged: (value) {
            vm.emailOnChanged(value ?? '');
          },
        ),
        const SizedBox(height: Constants.gridSpaceSmall),
        AppTextFormField(
          label: 'Password',
          hint: '**********',
          suffix: InkWell(
            onTap: vm.obscurePasswordOnTap,
            child: AnimatedSwitcher(
              duration: const Duration(
                  milliseconds: Constants.shortAnimationDuration),
              child: () {
                if (vm.obscurePassword) {
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
            vm.passwordOnChanged(value ?? '');
          },
        ),
        const SizedBox(height: Constants.gridSpaceMedium),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              vm.signUpOnTap(context);
            },
            child: const Text('Sign Up'),
          ),
        ),
      ],
    );
  }
}
