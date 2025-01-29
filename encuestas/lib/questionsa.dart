import 'package:flutter/material.dart';

class QuestionsAPage extends StatefulWidget {
  final Function(int) onPageChange;

  const QuestionsAPage({super.key, required this.onPageChange});

  @override
  State<QuestionsAPage> createState() => _QuestionsAPageState();
}

class _QuestionsAPageState extends State<QuestionsAPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Escribe tu nombre:',
                    border: OutlineInputBorder(),
                    labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Escribe tu telefono:',
                    border: OutlineInputBorder(),
                    labelText: 'telefono'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El telefono es obligario';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Escribe tu correo:',
                    border: OutlineInputBorder(),
                    labelText: 'correo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo es obligatorio';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Escribe tu matricula:',
                    border: OutlineInputBorder(),
                    labelText: 'matricula'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El matricula es obligatorio';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Escribe tu edad:',
                    border: OutlineInputBorder(),
                    labelText: 'Edad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La edad es obligatorio';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {widget.onPageChange(3)}
                      else
                        {_formKey.currentState!.save()}
                    },
                child: const Text('Continuar')),
          ],
        ),
      ),
    );
  }
}
