import 'package:flutter/material.dart';

class QuestionsBPage extends StatelessWidget {
  const QuestionsBPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Questions B',
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
