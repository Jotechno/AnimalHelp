import 'package:flutter/material.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/home_page.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/registro.dart';
import 'package:flutter_application_proteccion_animales/widgets/menuApp.dart';
import 'package:flutter_application_proteccion_animales/datos/user_list.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "PROTECCION DE ESPECIES",
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
        // Agregamos SingleChildScrollView aquí
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/img/icon.png'),
                  radius: 60,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Bienvenido a Animal Shield',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Preahvihear',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Usuario",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        controller: _userController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, digite el usuario';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        controller: _passController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, digite la contraseña';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          for (var usuario in usuarios) {
                            if (_userController.text == usuario.user) {
                              if (_passController.text != usuario.password) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("La contraseña no es correcta"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                break;
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Sesión iniciada con éxito"),
                                    backgroundColor:
                                        Color.fromARGB(255, 43, 136, 42),
                                  ),
                                );
                                break;
                              }
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Usuario no encontrado"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 43, 136, 42),
                      ),
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    const SizedBox(width: 70),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationPage()));
                      },
                      style: TextButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 43, 136, 4),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Center(
                          child: Text(
                            'Registrate',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
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
      ),
    );
  }
}
