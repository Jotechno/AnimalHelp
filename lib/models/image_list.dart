import 'package:flutter/material.dart';

final List imgList = [
  ['assets/img/MapacheFachero.jpeg', 'Pedro'],
  ['assets/img/Zorrito.jpeg', 'Eriberto'],
  ['assets/img/loro.jpeg', 'Diego'],
  ['assets/img/sarihuella.jpg', 'Oscarito'],
  ['assets/img/topo.png', 'Oscarito']
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(item[0],
                    fit: BoxFit.cover,
                    width: 1000.0,
                    height: 600.0), // Ajusta la altura aquí
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      '${item[1]}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ))
    .toList();
