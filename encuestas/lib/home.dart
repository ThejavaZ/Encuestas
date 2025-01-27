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
  String _title = _titles[0];

  late List<Widget> _pages; 
  
  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      DashBoardPage(),
      SurveyPage(onPageChange: _pageChanged,),
      QuestionsAPage(onPageChange: _pageChanged,),
      QuestionsBPage(onPageChange: _pageChanged,),
      SummaryPage(onPageChange: _pageChanged,),
    ];
  }


  static const List<String> _titles = <String>[
    "Inicio",
    "Nueva Encuesta",
    "Preguntas",
    "Preguntas (continuacion)",
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
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: 
          FloatingActionButton(  
            onPressed: () => _pageChanged(1), // Dashboard
            child: const Icon(Icons.add),
          
      ),
    );
  }
}
