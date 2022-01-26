import 'package:flutter/material.dart';
import 'package:imc_calculator/core/theme/theme.dart';
import 'package:imc_calculator/screens/home/widgets/todo_page.dart';
import 'widgets/form_calculate_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
  }

  setCurrentPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/images/logo_home.png'),
            const SizedBox(width: 25),
            Text(
              currentPage == 0 ? 'Calculadora IMC' : 'Lista de Tarefas',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 46),
            child: FormCalculateWidget(),
          ),
          TodoPage(),
        ],
        onPageChanged: setCurrentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppTheme.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'Calculadora de IMC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista de Tarefas',
          ),
        ],
        onTap: (page) {
          _controller.animateToPage(
            page,
            duration: const Duration(milliseconds: 100),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
