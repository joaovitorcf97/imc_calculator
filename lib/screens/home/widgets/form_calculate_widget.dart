import 'package:flutter/material.dart';
import 'package:imc_calculator/core/theme/theme.dart';
import 'package:imc_calculator/core/widgets/button_widget.dart';

class FormCalculateWidget extends StatefulWidget {
  const FormCalculateWidget({Key? key}) : super(key: key);

  @override
  State<FormCalculateWidget> createState() => _FormCalculateWidgetState();
}

class _FormCalculateWidgetState extends State<FormCalculateWidget> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  String _imc = '';

  void _imcCalculate() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text);
    double imc = weight / (height * height);

    setState(() {
      if (imc < 18.6) {
        _imc = 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _imc = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _imc = 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _imc = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        _imc = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 40) {
        _imc = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }

  void _resetValues() {
    _weightController.text = '';
    _heightController.text = '';

    setState(() {
      _imc = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 36),
            Image.asset('assets/images/person.png'),
            const SizedBox(height: 47),
            SizedBox(
              height: 80,
              child: TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira seu peso.';
                  }
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  hintTextDirection: TextDirection.ltr,
                  filled: true,
                  fillColor: AppTheme.white,
                  label: Text(
                    'Peso (Kg)',
                    style: TextStyle(fontSize: 14),
                  ),
                  labelStyle: TextStyle(
                    color: AppTheme.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua Altura";
                  }
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  hintTextDirection: TextDirection.ltr,
                  filled: true,
                  fillColor: AppTheme.white,
                  label: Text(
                    'Altura (cm)',
                    style: TextStyle(fontSize: 14),
                  ),
                  labelStyle: TextStyle(
                    color: AppTheme.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 33),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    text: 'Calcular',
                    color: AppTheme.pink,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _imcCalculate();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  color: AppTheme.pink,
                  onPressed: () {
                    _resetValues();
                  },
                  icon: const Icon(
                    Icons.autorenew_outlined,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            Text(_imc),
          ],
        ),
      ),
    );
  }
}
