import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_proteccion_animales/models/animal.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/second_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_proteccion_animales/widgets/menuApp.dart';

import '../../datos/anim_list.dart';

class RegistrationAnimal extends StatefulWidget {
  const RegistrationAnimal({super.key});

  @override
  State<RegistrationAnimal> createState() => _RegistrationAnimalState();
}

class _RegistrationAnimalState extends State<RegistrationAnimal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _habitController = TextEditingController();
  final TextEditingController _peligController = TextEditingController();
  final TextEditingController _catController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  String imagen = "";

  Future<void> _pickImage() async {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      setState(() {
        imagen = pickImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "REGISTRO DE ANIMALES",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1D1B20),
              fontSize: 22,
              fontFamily: 'Preahvihear',
              fontWeight: FontWeight.w900,
              height: 1.27,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 43, 136, 4)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nombre del animal",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite el nombre del animal';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Hábitad",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  controller: _habitController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite el hábitad';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nivel de peligro",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  controller: _peligController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite el nivel de peligro';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Categoria",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  controller: _catController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite la categoria';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Información",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  controller: _infoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese la infromación';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: _pickImage, child: const Text("Elija la foto")),
                if (imagen.isNotEmpty) Image.file(File(imagen)),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var animal = Animal(
                          nombre: _nameController.text,
                          habitat: _habitController.text,
                          peligro: _peligController.text,
                          categoria: _catController.text,
                          info: _infoController.text,
                          imagen: imagen);
                      animalesPeligro.add(animal);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnimalesPeligro()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Registro exitoso'),
                          backgroundColor: Color.fromARGB(255, 43, 136, 42),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registro exitoso')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 43, 136, 42),
                  ),
                  child: const Text(
                    'Registrar animal',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                    height:
                        15), // Espacio entre los botones y el texto "ESPECIES ANIMALES"
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'ESPECIES ANIMALES',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.withOpacity(0.5), // Color del texto
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
