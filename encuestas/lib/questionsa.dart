import 'package:flutter/material.dart';

class QuestionsAPage extends StatelessWidget {
  const QuestionsAPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Encuesta A',
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
