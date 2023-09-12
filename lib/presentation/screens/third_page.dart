import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_proteccion_animales/widgets/menuDrawer.dart';

import 'login.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CERCA DE MI",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF1D1B20),
            fontSize: 22,
            fontFamily: 'Preahvihear',
            fontWeight: FontWeight.w900,
            height: 1.27,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 43, 136, 42),
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
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/img/2d.jpg',
                width: 800,
                height: 240,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text(
                'Animales',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'Preahvihear',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Foto',
                    style: TextStyle(
                      color: Color.fromARGB(255, 64, 65, 73),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Borel',
                    ),
                  ),
                  Text(
                    '   Especie',
                    style: TextStyle(
                      color: Color.fromARGB(255, 43, 42, 42),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Borel',
                    ),
                  ),
                  Text(
                    'Distancia',
                    style: TextStyle(
                      color: Color.fromARGB(255, 64, 65, 73),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Borel',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height:
                      15), // Espacio entre los botones y el texto "ESPECIES ANIMALES"

              _buildAnimalRow('assets/img/monkey.png', 'Monito', '    1.5'),
              _buildAnimalRow('assets/img/zarigueya.png', 'Zarigueya', '2.5'),
              _buildAnimalRow('assets/img/topo.png', 'Topo', '       4.5'),
              _buildAnimalRow('assets/img/fox.png', 'Zorro', '      0.5'),
              _buildAnimalRow('assets/img/mapacheR.png', 'Mapache', '   2'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalRow(String imageAsset, String species, String distance) {
    bool isFar = double.parse(distance) > 2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          imageAsset,
          width: 80,
          height: 80,
          fit: BoxFit.contain,
        ),
        Text(
          species,
          style: TextStyle(
            color: Color.fromARGB(255, 43, 42, 42),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Borel',
          ),
        ),
        Text(
          distance,
          style: TextStyle(
            color: isFar ? Colors.red : Color.fromARGB(255, 43, 136, 42),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Borel',
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Km',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0), // Color del texto
            ),
          ),
        ),
      ],
    );
  }
}
