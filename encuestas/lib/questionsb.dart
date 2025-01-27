import 'package:flutter/material.dart';

class QuestionsBPage extends StatelessWidget {

    final Function(int) onPageChange;
  
  const QuestionsBPage({super.key, required this.onPageChange});

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
          ElevatedButton(onPressed: () => onPageChange(4), child: const Text('Continuar')),
        ],
      ),
    );
  }
}
