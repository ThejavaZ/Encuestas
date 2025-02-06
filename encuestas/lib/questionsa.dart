import 'package:flutter/material.dart';

class QuestionsAPage extends StatefulWidget {
  final Function(int) onPageChange;
  final Function(Map<String, dynamic>) onSave;

  const QuestionsAPage(
      {super.key, required this.onPageChange, required this.onSave});
  @override
  State<QuestionsAPage> createState() => _QuestionsAPage();
}

class _QuestionsAPage extends State<QuestionsAPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _recordController = TextEditingController();
    final TextEditingController _ageController = TextEditingController();

    return Center(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        hintText: 'Escribe tu nombre:',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El nombre es obligatorio';
                        }
                        if (value.length < 3) {
                          return 'El nombre debe tener al menos 3 caracteres';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                    )),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                        hintText: 'Escribe tu telefono:',
                        border: OutlineInputBorder(),
                        labelText: 'telefono'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El telefono es obligario';
                      }
                      if (!RegExp(r"^\d{10}$").hasMatch(value)) {
                        return 'El telefono no es válido';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Escribe tu correo:',
                        border: OutlineInputBorder(),
                        labelText: 'correo'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El correo es obligatorio';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'El correo no es válido';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _recordController,
                    decoration: const InputDecoration(
                        hintText: 'Escribe tu matricula:',
                        border: OutlineInputBorder(),
                        labelText: 'matricula'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El matricula es obligatorio';
                      } else if (int.tryParse(value) == null) {
                        return 'El matricula debe ser un número';
                      } else if (int.tryParse(value)! < 10) {
                        return 'El matricula debe ser de al menos a 10 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                        hintText: 'Escribe tu edad:',
                        border: OutlineInputBorder(),
                        labelText: 'Edad'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'La edad es obligatorio';
                      }
                      if (int.tryParse(value) == null) {
                        return 'La edad debe ser un número';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onSave({
                        'name': _nameController.text,
                        'phone': _phoneController.text,
                        'email': _emailController.text,
                        'record': _recordController.text,
                        'age': int.tryParse(_ageController.text),
                      });
                      widget.onPageChange(3);
                    } else {
                      _formKey.currentState!.save();
                    }
                  },
                  child: const Text('Continuar'),
                ),
              ],
            )));
  }
}
