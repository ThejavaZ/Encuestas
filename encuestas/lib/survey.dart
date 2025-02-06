import 'package:flutter/material.dart';

class SurveyPage extends StatelessWidget {
  final Function(int) onPageChange;

  const SurveyPage({super.key, required this.onPageChange});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Encuesta',
            style: TextStyle(fontSize: 40),
          ),
          ElevatedButton(
              onPressed: () => onPageChange(2), child: const Text('Iniciar')),
        ],
      ),
    );
  }
}
