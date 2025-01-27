import 'package:encuestas/dashboard.dart';
import 'package:encuestas/survey.dart';
import 'package:encuestas/questionsa.dart';
import 'package:encuestas/questionsb.dart';
import 'package:encuestas/summary.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    DashBoardPage(),
    SurveyPage(),
    QuestionsAPage(),
    QuestionsBPage(),
    SummaryPage(),
  ];

  static const List<String> _titles = <String>[
    'Dashboard',
    'Nueva Encuesta',
    'Encuesta A',
    'Encuesta B',
    'Resumen',
  ];

  void _pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_titles[_selectedIndex]),
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => _pageChanged(0), // Dashboard
            child: const Icon(Icons.dashboard),
          ),
          ElevatedButton(
            onPressed: () => _pageChanged(1), // Nueva Encuesta
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () => _pageChanged(2), // Encuesta A
            child: const Icon(Icons.question_answer),
          ),
          ElevatedButton(
            onPressed: () => _pageChanged(3), // Encuesta B
            child: const Icon(Icons.question_answer),
          ),
          ElevatedButton(
            onPressed: () => _pageChanged(4), // Resumen
            child: const Icon(Icons.list),
          ),
        ],
      ),
    );
  }
}
