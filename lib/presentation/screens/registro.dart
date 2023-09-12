import 'package:flutter/material.dart';
import 'package:flutter_application_proteccion_animales/datos/user_list.dart';
import 'package:flutter_application_proteccion_animales/models/usuario.dart';
import 'package:flutter_application_proteccion_animales/presentation/screens/login.dart';
import 'package:flutter_application_proteccion_animales/widgets/menuApp.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

final _formKey = GlobalKey<FormState>();
final TextEditingController _userController = TextEditingController();
final TextEditingController _passController = TextEditingController();
final TextEditingController _conpassController = TextEditingController();
final TextEditingController _mailController = TextEditingController();

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "REGISTRO",
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  controller: _mailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite el correo';
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite la contraseña';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirmar contraseña",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  controller: _conpassController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, verifique la contraseña';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_passController.text != _conpassController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Las contraseñas no coinciden"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            var usuario = Usuario(
                              user: _userController.text,
                              email: _mailController.text,
                              password: _passController.text,
                            );
                            usuarios.add(usuario);

                            _userController.clear();
                            _mailController.clear();
                            _passController.clear();
                            _conpassController.clear();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Registro exitoso'),
                                backgroundColor:
                                    Color.fromARGB(255, 43, 136, 42),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 43, 136, 42),
                      ),
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    const SizedBox(width: 70),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 43, 136, 42),
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height:
                        15), // Espacio entre los botones y el texto "ESPECIES ANIMALES"
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
