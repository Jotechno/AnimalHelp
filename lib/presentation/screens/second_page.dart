import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_proteccion_animales/models/animal.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/login.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/registrar_animal.dart';
import 'package:flutter_application_proteccion_animales/widgets/menuDrawer.dart';

import '../../datos/anim_list.dart';

class AnimalesPeligro extends StatefulWidget {
  const AnimalesPeligro({Key? key}) : super(key: key);

  @override
  State<AnimalesPeligro> createState() =>
      _AnimalesPeligroState(animalesPeligro: animalesPeligro);
}

class _AnimalesPeligroState extends State<AnimalesPeligro> {
  final List<Animal> animalesPeligro;

  _AnimalesPeligroState({required this.animalesPeligro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ANIMALES EN EN PELIGRO",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF1D1B20),
            fontSize: 22,
            fontFamily: 'Preahvihear',
            fontWeight: FontWeight.w900,
            height: 1.27,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 136, 4),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'cerrarSesion') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'cerrarSesion',
                child: Text('Cerrar Sesión'),
              ),
            ],
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/img/peli.jpg',
                  width: 700,
                  height: 125,
                ),
                const Text(
                  'Animales en peligro',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Preahvihear',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'A continuacion se mostrara una lista con unos cuantos animales que se encuentran en peligro de extinción, su nombre, su habitad y su nivel de peligro.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Preahvihear',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationAnimal()));
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 20,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Registrar animal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 43, 136, 42),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: animalesPeligro.length,
                itemBuilder: (BuildContext context, int index) {
                  final animal = animalesPeligro[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimalDetallado(animal: animal),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Image.file(
                        File(animal.imagen),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(animal.nombre),
                      subtitle: Text(
                        'Hábitat: ${animal.habitat} - Nivel de riesgo: ${animal.peligro}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalDetallado extends StatefulWidget {
  final Animal animal;

  const AnimalDetallado({Key? key, required this.animal}) : super(key: key);

  @override
  _AnimalDetalladoState createState() => _AnimalDetalladoState(animal: animal);
}

class _AnimalDetalladoState extends State<AnimalDetallado> {
  final Animal animal;

  _AnimalDetalladoState({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          animal.nombre,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontFamily: 'Preahvihear',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 43, 136, 42),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
              File(animal.imagen),
              width: 300,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text('Nombre: ${animal.nombre}'),
            Text('Hábitat: ${animal.habitat}'),
            Text('Nivel de riesgo: ${animal.peligro}'),
            Text('Categoría: ${animal.categoria}'),
            const SizedBox(height: 10),
            const Text('Información:'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                animal.info,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
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
    );
  }
}
