import 'package:flutter/material.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/home_page.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/second_page.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/third_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/img/sarihuella.jpg',
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                height: 150,
                child: Center(
                  child: Text(
                    'Protección de especies',
                    style: GoogleFonts.kanit(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.house),
                    title: Text(
                      'Página principal',
                      style: GoogleFonts.kanit(),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.hippo),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Text(
                        'Animales en peligro',
                        style: GoogleFonts.kanit(),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AnimalesPeligro(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.locationDot),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        'Animales cerca de mi',
                        style: GoogleFonts.kanit(),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const ThirdPage(),
                        ),
                      );
                    },
                  ),
                  // Resto de los ListTile con ajustes similares
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
