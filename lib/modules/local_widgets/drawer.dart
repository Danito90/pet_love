import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_love/global_widgets/pet_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_love/routes/app_routes.dart';

class DrawerPet extends GetView<PetController> {
  double h = Get.height;
  double w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Center(
                  child: _opcion(
                      "Usuario",
                      "Conectado",
                      Icon(
                        FontAwesomeIcons.solidUserCircle,
                        size: 70,
                      ),
                      Colors.white,
                      30))),
/*           ListTile(
            title: Text(
              'Dark Theme',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text("(tema oscuro)"),
            leading: CupertinoSwitch(
              value: controller.switchTheme.value,
              activeColor: Colors.green[500],
              onChanged: (value) => {
                controller.switchTheme.value = value,
                Get.isDarkMode
                    ? Get.changeTheme(ThemeData.light())
                    : Get.changeTheme(ThemeData.dark()),
              },
            ),
          ), */
          GestureDetector(
            child: _opcion(
                "  Inicio",
                "  (home)",
                Icon(
                  FontAwesomeIcons.home,
                  size: 30,
                  color: Colors.black,
                ),
                Colors.black,
                20),
            onTap: () {
              controller.blanquear();
              Get.toNamed(AppRoutes.HOME);
            },
          ),
          GestureDetector(
            child: _opcion(
                "  Agregar",
                "  (buscado)",
                Image.asset(
                  "buscar.png",
                  height: h * 0.053,
                ),
                Colors.black,
                20),
            onTap: () {
              controller.blanquear();
              controller.mascotas.buscado = true;
              controller.mascotas.encontrado = false;
              Get.toNamed(AppRoutes.AGREGAR, arguments: "Agregar buscado");
            },
          ),
          GestureDetector(
            child: _opcion(
                "  Agregar",
                "  (encontrado)",
                Image.asset(
                  "perro-delante-de-un-hombre.png",
                  height: h * 0.045,
                ),
                Colors.black,
                20),
            onTap: () {
              controller.blanquear();
              controller.mascotas.buscado = false;
              controller.mascotas.encontrado = true;
              Get.toNamed(AppRoutes.AGREGAR, arguments: "Agregar encontrado");
            },
          ),
          GestureDetector(
            child: _opcion(
                "  Salir",
                "",
                Icon(
                  Icons.exit_to_app,
                  size: 30,
                  color: Colors.black,
                ),
                Colors.black,
                20),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }

  Widget _opcion(
      String titulo, String subtitulo, icono, colorTitulo, double tamaoTitulo) {
    return ListTile(
      title: Text(
        titulo,
        style: TextStyle(
            fontSize: tamaoTitulo,
            fontWeight: FontWeight.w500,
            color: colorTitulo),
      ),
      leading: icono,
      subtitle: Text(
        subtitulo,
        style: TextStyle(
            fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
