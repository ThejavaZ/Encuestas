import 'package:encuestas/dashboard.dart';
import 'package:encuestas/survey.dart';
import 'package:encuestas/questionsa.dart';
import 'package:encuestas/questionsb.dart';
import 'package:encuestas/summary.dart';
import 'package:flutter/material.dart';
import 'package:encuestas/models/students.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _title = _titles[0];

  Student student = Student();

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      DashBoardPage(),
      SurveyPage(onPageChange: _pageChanged),
      QuestionsAPage(
        onPageChange: _pageChanged,
        onSave: (data) {
          setState(() {
            student.update(
              name: data['name'],
              phone: data['phone'],
              email: data['email'],
              record: data['record'],
              age: data['age'],
            );
          });
        },
      ),
      QuestionsBPage(
        onPageChange: _pageChanged,
        onSave: (data) {
          setState(() {
            student.update(
              shift: data['shift'],
              degree: data['degree'],
              specialization: data['specialization'],
              prom: data['prom'],
              section: data['section'],
            );
          });
        },
      ),
      SummaryPage(student: student, onPageChange: _pageChanged),
    ];
  }

  static const List<String> _titles = <String>[
    "Inicio",
    "Nueva Encuesta",
    "Preguntas",
    "Preguntas (continuación)",
    "Resumen",
  ];

  void _pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _title = _titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title),
        leading: _selectedIndex != 0
            ? IconButton(
                onPressed: () => _pageChanged(_selectedIndex - 1),
                icon: const Icon(Icons.arrow_back),
              )
            : null,
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () => _pageChanged(1),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
