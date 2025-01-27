import 'package:flutter/material.dart';

class QuestionsAPage extends StatelessWidget {
  final Function(int) onPageChange;
  
  const QuestionsAPage({super.key, required this.onPageChange});


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
          ElevatedButton(onPressed: () => onPageChange(3), child: const Text('Continuar')),
        ],
      ),
    );
  }
}
