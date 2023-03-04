import 'package:flutter/material.dart';
import 'package:todo/shared/constants.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String description;
  final bool isCompleted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Constants.gridSpaceSmall,
            vertical: Constants.gridSpaceSmall,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          trailing: Checkbox(
            value: isCompleted,
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
