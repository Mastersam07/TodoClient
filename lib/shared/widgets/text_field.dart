import 'package:flutter/material.dart';
import '../constants.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.label,
    this.hint,
    this.suffix,
    this.prefix,
  }) : super(key: key);
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onEditingComplete;
  final String? label;
  final String? hint;
  final Widget? suffix;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: const OutlineInputBorder(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: Constants.gridSpaceSmall),
      ),
    );
  }
}
