import 'package:flutter/material.dart';
import 'package:encuestas/models/students.dart';

class SummaryPage extends StatelessWidget {
  final Function(int) onPageChange;
  final Student student;

  const SummaryPage(
      {super.key, required this.onPageChange, required this.student});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Resumen', style: TextStyle(fontSize: 40)),
          Text('Nombre: ${student.name}'),
          Text('Teléfono: ${student.phone}'),
          Text('Email: ${student.email}'),
          Text('Matrícula: ${student.record}'),
          Text('Edad: ${student.age}'),
          Text('Horario: ${student.shift}'),
          Text('Carrera: ${student.degree}'),
          Text('Especialización: ${student.specialization}'),
          Text('Promedio: ${student.prom}'),
          Text('Sección: ${student.section}'),
          ElevatedButton(
            onPressed: () => onPageChange(0),
            child: const Text('Inicio'),
          ),
        ],
      ),
    );
  }
}
