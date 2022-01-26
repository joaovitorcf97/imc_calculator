import 'package:flutter/material.dart';
import 'package:imc_calculator/controller/todo_controller.dart';
import 'package:imc_calculator/core/theme/theme.dart';
import 'package:imc_calculator/core/widgets/button_widget.dart';
import 'package:imc_calculator/model/task.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _textController = TextEditingController();

  void _submitForm() {
    if (_textController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Texto não informado'),
        ),
      );

      return;
    }

    Provider.of<TodoController>(context, listen: false).addTask(
      _textController.text,
      false,
    );

    _textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Provider.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                height: 80,
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintTextDirection: TextDirection.ltr,
                    filled: true,
                    fillColor: AppTheme.white,
                    label: Text(
                      'Nova tarefa',
                      style: TextStyle(fontSize: 14),
                    ),
                    labelStyle: TextStyle(
                      color: AppTheme.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ButtonWidget(
                  text: 'Add',
                  color: AppTheme.pink,
                  onTap: () {
                    _submitForm();
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Consumer<TodoController>(
            child: const Center(
              child: Text('Nenhuma Task'),
            ),
            builder: (context, task, child) => task.itemsCount == 0
                ? child!
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: task.itemsCount,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.startToEnd,
                        confirmDismiss: (_) {
                          return showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Tem certeza?'),
                              content: const Text('Quer remover essa tarefa?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop(false);
                                  },
                                  child: const Text('Não'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop(true);
                                  },
                                  child: const Text('Sim'),
                                ),
                              ],
                            ),
                          );
                        },
                        onDismissed: (_) {
                          Provider.of<TodoController>(
                            context,
                            listen: false,
                          ).removeTaskId(task.itemByIndex(index).id);
                        },
                        background: Container(
                          color: Theme.of(context).errorColor,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 40,
                          ),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: CheckboxListTile(
                          title: Text(
                            task.itemByIndex(index).text,
                            style: TextStyle(
                              decoration: task.itemByIndex(index).check == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          secondary: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              task.itemByIndex(index).check == false ? Icons.error_outlined : Icons.check_circle,
                              color: AppTheme.pink,
                            ),
                          ),
                          value: task.itemByIndex(index).check,
                          onChanged: (value) {
                            setState(() {
                              task.itemByIndex(index).check == false
                                  ? task.itemByIndex(index).check = true
                                  : task.itemByIndex(index).check = false;
                            });
                          },
                          activeColor: AppTheme.pink,
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
