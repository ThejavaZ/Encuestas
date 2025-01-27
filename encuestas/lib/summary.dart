import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
    final Function(int) onPageChange;
  
  const SummaryPage({super.key, required this.onPageChange});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Resumen',
            style: TextStyle(fontSize: 40),
          ),

          ElevatedButton(onPressed: () => onPageChange(0), child: const Text('Inicio')),
        ],
      ),
    );
  }
}
