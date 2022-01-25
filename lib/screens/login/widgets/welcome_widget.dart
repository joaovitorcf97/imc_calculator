import 'package:flutter/material.dart';
import 'package:imc_calculator/core/theme/theme.dart';

class WelcomeWidget extends StatelessWidget {
  final String textWelcome;
  final String nameApp;

  const WelcomeWidget({
    Key? key,
    required this.textWelcome,
    required this.nameApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textWelcome,
          style: const TextStyle(
            color: AppTheme.white,
            fontSize: 31,
          ),
        ),
        Text(
          nameApp,
          style: const TextStyle(
            color: AppTheme.white,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
