import 'package:flutter/material.dart';

class QuestionsBPage extends StatefulWidget {
  final Function(int) onPageChange;
  final Function(Map<String, dynamic>) onSave;

  const QuestionsBPage(
      {super.key, required this.onPageChange, required this.onSave});

  @override
  State<QuestionsBPage> createState() => _QuestionsBPage();
}

class _QuestionsBPage extends State<QuestionsBPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _shifts = ['Matutino', 'Vespertino'];
  final List<String> _degrees = ['Desarrollo de Software', 'Redes'];
  final List<String> _specialities = ['Técnico', 'Ingeniería'];
  final List<String> _sections = [
    'Norte',
    'Sur',
    'Centro',
    'Oriente',
    'Poniente'
  ];

  String? _selectedShift;
  String? _selectedDegree;
  String? _selectedSpeciality;
  String? _selectedSection;
  final TextEditingController _promController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                decoration:
                    const InputDecoration(labelText: "Horario Preferencial"),
                items: _shifts.map((shift) {
                  return DropdownMenuItem(value: shift, child: Text(shift));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedShift = value;
                  });
                },
                value: _selectedShift,
                validator: (value) =>
                    value == null ? 'Selecciona un horario' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Carrera"),
                items: _degrees.map((degree) {
                  return DropdownMenuItem(value: degree, child: Text(degree));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDegree = value;
                  });
                },
                value: _selectedDegree,
                validator: (value) =>
                    value == null ? 'Selecciona una carrera' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Especialización"),
                items: _specialities.map((speciality) {
                  return DropdownMenuItem(
                      value: speciality, child: Text(speciality));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSpeciality = value;
                  });
                },
                value: _selectedSpeciality,
                validator: (value) =>
                    value == null ? 'Selecciona una especialización' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _promController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Promedio'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa un promedio';
                  }
                  final prom = double.tryParse(value);
                  if (prom == null || prom < 0 || prom > 10) {
                    return 'Promedio inválido (0-10)';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Sección"),
                items: _sections.map((section) {
                  return DropdownMenuItem(value: section, child: Text(section));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSection = value;
                  });
                },
                value: _selectedSection,
                validator: (value) =>
                    value == null ? 'Selecciona una sección' : null,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave({
                    'shift': _selectedShift,
                    'degree': _selectedDegree,
                    'specialization': _selectedSpeciality,
                    'prom': double.tryParse(_promController.text),
                    'section': _selectedSection,
                  });
                  widget.onPageChange(4);
                }
              },
              child: const Text('Guardar y Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
