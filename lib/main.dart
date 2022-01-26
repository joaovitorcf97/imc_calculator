import 'package:flutter/material.dart';
import 'package:imc_calculator/controller/todo_controller.dart';
import 'package:imc_calculator/core/routes/app_routes.dart';
import 'package:imc_calculator/core/theme/theme.dart';
import 'package:imc_calculator/screens/home/home_page.dart';
import 'package:imc_calculator/screens/login/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculadora IMC',
        theme: AppTheme.theme,
        routes: {
          AppRoutes.login: (ctx) => const LoginPage(),
          AppRoutes.home: (ctx) => const HomePage(),
        },
      ),
    );
  }
}
