import 'package:flutter/material.dart';
import 'package:imc_calculator/core/routes/app_routes.dart';
import 'package:imc_calculator/core/theme/theme.dart';
import 'package:imc_calculator/core/widgets/button_widget.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                hintTextDirection: TextDirection.ltr,
                filled: true,
                fillColor: AppTheme.white,
                hintText: 'Usuario',
                hintStyle: const TextStyle(
                  color: AppTheme.grey,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: AppTheme.white),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: AppTheme.white),
                  borderRadius: BorderRadius.circular(50),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                hintTextDirection: TextDirection.ltr,
                filled: true,
                fillColor: AppTheme.white,
                hintText: 'Senha',
                hintStyle: const TextStyle(
                  color: AppTheme.grey,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: AppTheme.white),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: AppTheme.white),
                  borderRadius: BorderRadius.circular(50),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: ButtonWidget(
                  text: 'ENTRAR',
                  color: AppTheme.black,
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.home);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
