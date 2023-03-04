import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/features/authentication/presentation/views/auth.dart';
import 'package:todo/shared/constants.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      Timer(
        const Duration(milliseconds: 1600),
        () => Navigator.of(context).pushReplacementNamed(AuthScreen.route),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  '💼',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
                SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(Constants.smallBorderRadius)),
                  child: LinearProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
