import 'package:encuestas/dashboard.dart';
import 'package:encuestas/survey.dart';
import 'package:flutter/material.dart';
import 'package:encuestas/questionsa.dart';
import 'package:encuestas/questionsb.dart';
import 'package:encuestas/summary.dart';

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
          title: Text('Encuestas'),
        ),
        body: _pages.elementAt(_selectedIndex),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _pageChanged,
          tooltip: 'Nueva Encuesta',
          child: const Icon(Icons.add),
        ));
  }
}
