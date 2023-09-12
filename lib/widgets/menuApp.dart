import 'package:flutter/material.dart';

class AppBarMenu extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const AppBarMenu({super.key, required this.title});

  @override
  State<AppBarMenu> createState() => _AppBarMenuState();

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

class _AppBarMenuState extends State<AppBarMenu> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF1D1B20),
          fontSize: 22,
          fontFamily: 'Preahvihear',
          fontWeight: FontWeight.w400,
          height: 1.27,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 43, 136, 42),
      // actions: const [
      //   CircleAvatar(
      //     backgroundImage:
      //         AssetImage(''),
      //     radius: 20,
      //   ),
      // ],

      centerTitle: true,
    );
  }
}
