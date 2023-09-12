import 'package:flutter/material.dart';
import 'package:flutter_application_proteccion_animales/models/image_list.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/second_page.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/third_page.dart';
import 'package:flutter_application_proteccion_animales/widgets/menuDrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "PÁGINA PRINCIPAL",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: imageSliders,
                    ),
                    const Text(
                      'Nuestros Facheritos',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Preahvihear',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '"Descubre la protección animal a través de nuestra aplicación, enfocada en el bienestar y la conservación de especies en peligro ,Proporcionamos información crucial, recursos para tomar medidas y la posibilidad de reportar abusos. Aumenta la conciencia y toma medidas concretas para garantizar la seguridad de los animales y sus hábitats."',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Preahvihear',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ), // Espacio entre el carrusel y los botones
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AnimalesPeligro(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.dangerous_outlined,
                            size: 40, // Tamaño del icono aumentado
                            color: Color.fromARGB(
                                255, 255, 50, 50), // Color del icono
                          ),
                          label: const Column(
                            children: [
                              SizedBox(
                                  height:
                                      5), // Espacio entre el icono y el texto
                              Text(
                                'Animales  ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(
                                      255, 255, 50, 50), // Color del texto
                                ),
                              ),
                              Text(
                                'en peligro  ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(
                                      255, 255, 50, 50), // Color del texto
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 255, 254,
                                254), // Fondo gris más transparente
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ThirdPage(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.radar,
                            size: 40, // Tamaño del icono aumentado
                            color: Color.fromARGB(
                                255, 61, 148, 65), // Color del icono
                          ),
                          label: const Column(
                            children: [
                              SizedBox(
                                  height:
                                      5), // Espacio entre el icono y el texto
                              Text(
                                'Animales  ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(
                                      255, 61, 148, 65), // Color del texto
                                ),
                              ),
                              Text(
                                'cerca de mi  ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(
                                      255, 61, 148, 65), // Color del texto
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 255, 255,
                                255), // Fondo gris más transparente
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height:
                            55), // Espacio entre los botones y el texto "ESPECIES ANIMALES"
                    Container(
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
