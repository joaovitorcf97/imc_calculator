import 'package:flutter/material.dart';
import 'package:imc_calculator/core/theme/theme.dart';
import 'package:imc_calculator/screens/login/widgets/form_widget.dart';
import 'package:imc_calculator/screens/login/widgets/logo_widget.dart';
import 'package:imc_calculator/screens/login/widgets/welcome_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pink,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 76),
                LogoWidget(),
                SizedBox(height: 129),
                WelcomeWidget(
                  textWelcome: 'Seja bem vindo!',
                  nameApp: 'Calculadora IMC',
                ),
                SizedBox(height: 43),
                FormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
