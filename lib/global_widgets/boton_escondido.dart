/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:bottomreveal/bottomreveal.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pet_love/global_widgets/pet_controller.dart';
import 'package:pet_love/routes/app_routes.dart';

class BotonEscondido extends GetView<PetController> {
  double h = Get.height;
  double w = Get.width;
  @override
  final BottomRevealController _menuController = BottomRevealController();
  @override
  Widget build(BuildContext context) {
    return BottomReveal(
      openIcon: Icons.menu,
      closeIcon: Icons.close,
      revealWidth: 100,
      revealHeight: 100,
      backColor: Colors.blue[400],
      frontColor: Colors.white,
      rightContent: _buildRightMenu(),
      bottomContent: _buildBottomContent(),
      controller: _menuController,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: w,
                height: h * 0.08,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "huellas.png",
                        height: h * 0.05,
                        color: Colors.black,
                      ),
                      Container(
                        width: w * 0.03,
                      ),
                      Text(
                        "Bienvenidos!!",
                        style: TextStyle(
                          fontSize: h * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                        ),
                      ),
                      Container(
                        width: w * 0.03,
                      ),
                      Image.asset(
                        "huellas.png",
                        height: h * 0.05,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.08,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "Objetivo de la aplicacion",
                    style: TextStyle(
                      fontSize: h * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: w * 0.93,
                height: h * 0.25,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "El principal y único objetivo, es lograr la mayor cantidad de reencuentros posibles. \nVamos a poder publicar mascotas que se nos han extraviado, como así también animales que nosotros hayamos encontrado y queremos dar con su dueño.\nTengo la certeza que si entre todos colaboramos esto es posible.",
                    style: TextStyle(
                      fontSize: h * 0.023,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.08,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "Ayuda con significado de iconos",
                    style: TextStyle(
                      fontSize: h * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: h * 0.01,
              ),
              _opcion(
                "Buscando mascota",
                "En este icono vamos a encontrar mascotas perdidas y que sus dueños estan buscando",
                Image.asset(
                  "buscar.png",
                  height: h * 0.05,
                  color: Colors.black,
                ),
              ),
              Container(
                height: h * 0.01,
              ),
              _opcion(
                "Mascota encontrada en la calle",
                "Cuando una persona encuentra a un perro perdido, y decide publicarlo para encontrar su dueño",
                Image.asset(
                  "perro-delante-de-un-hombre.png",
                  height: h * 0.05,
                  color: Colors.black,
                ),
              ),
              Container(
                height: h * 0.01,
              ),
              _opcion(
                "Editar",
                "Ingresar a modificar una mascota ya cargada",
                Image.asset(
                  "editar.png",
                  height: h * 0.05,
                  color: Colors.black,
                ),
              ),
              Container(
                height: h * 0.01,
              ),
              _opcion(
                "Eliminar",
                "Elimina una mascotas cargadas. También, borra fotos para carga de mascotas",
                Image.asset(
                  "eliminar.png",
                  height: h * 0.05,
                  color: Colors.black,
                ),
              ),
              Container(
                height: h * 0.01,
              ),
              _opcion(
                "Sin foto",
                "Este icono indica que no hay foto de la mascota cargada",
                Image.asset(
                  "silueta2.jpg",
                  height: h * 0.05,
                ),
              ),
              _opcion(
                "Actualizar",
                "Actualiza la carga de mascotas",
                Image.asset(
                  "actualizar.png",
                  height: h * 0.05,
                ),
              ),
              _opcion(
                "Agregar",
                "Al apretar, tenemos la opción de agregar una nueva mascota buscada o encontrada",
                Icon(Icons.add, size: h * 0.05, color: Colors.black),
              ),
              Container(
                height: h * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _opcion(String titulo, String subtitulo, icono) {
    return ListTile(
      title: Text(
        titulo,
        style: TextStyle(
            fontSize: h * 0.03,
            fontWeight: FontWeight.w500,
            color: Colors.red[900]),
      ),
      leading: icono,
      subtitle: Text(
        subtitulo,
        style: TextStyle(
            fontSize: h * 0.02,
            fontWeight: FontWeight.w500,
            color: Colors.black),
      ),
    );
  }

  Widget _buildBottomContent() {
    return MaterialButton(
      height: 60.0,
      padding: const EdgeInsets.all(0),
      textColor: Colors.black,
      minWidth: 60,
      child: Icon(
        Icons.add,
        size: 60,
      ),
      color: Colors.lightGreenAccent,
      elevation: 0,
      onPressed: () {
        Get.defaultDialog(
            title: "Elije una opcion:",
            backgroundColor: Colors.green[100],
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Divider(
                      height: 25,
                      color: Colors.green.withOpacity(0.40),
                      thickness: 2,
                    ),
                    FlatButton(
                        child: Text(
                          "   Perdidos   ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        splashColor: Colors.green,
                        color: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.deepPurple)),
                        onPressed: () {
                          controller.mascotas.buscado = true;
                          controller.mascotas.encontrado = false;
                          Get.toNamed(AppRoutes.AGREGAR,
                              arguments: "Agregar buscado");
                        }),
                    Divider(
                      height: 25,
                      color: Colors.green.withOpacity(0.40),
                      thickness: 2,
                    ),
                    FlatButton(
                        child: Text(
                          "Encontrados",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        splashColor: Colors.green,
                        color: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.deepPurple)),
                        onPressed: () {
                          controller.mascotas.encontrado = true;
                          controller.mascotas.buscado = false;
                          Get.toNamed(AppRoutes.AGREGAR,
                              arguments: "Agregar encontrado");
                        }),
/*                     Divider(
                      height: 25,
                      color: Colors.green.withOpacity(0.40),
                      thickness: 2,
                    ),
                    FlatButton(
                        child: Text("   Adopción   "),
                        splashColor: Colors.green,
                        color: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.deepPurple)),
                        onPressed: () {
                          Get.offNamed(AppRoutes.AGREGAR,
                              arguments: "adopcion");
                        }), */
                  ],
                ),
              )
            ]);
      },
    );
  }
  /* TextField _buildBottomContent() {
    //boton busqueda
    return TextField(
      style: TextStyle(color: Colors.white, fontSize: 18.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey,
        contentPadding: const EdgeInsets.all(16.0),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
            gapPadding: 8.0,
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  } */

  Column _buildRightMenu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MaterialButton(
          height: 60.0,
          padding: const EdgeInsets.all(0),
          textColor: Colors.black,
          minWidth: 60,
          child: Image.asset(
            "buscar.png",
            height: h * 0.055,
          ),
          color: Colors.lightGreenAccent,
          elevation: 0,
          onPressed: () {
            controller.getMascotasAll();

            Get.offNamed(AppRoutes.BUSCADOS);
          },
        ),
        const SizedBox(height: 10.0),
        MaterialButton(
          height: 60.0,
          padding: const EdgeInsets.all(0),
          textColor: Colors.black,
          minWidth: 60,
          child: Image.asset(
            "perro-delante-de-un-hombre.png",
            height: h * 0.055,
          ),
          color: Colors.lightGreenAccent,
          elevation: 0,
          onPressed: () {
            Get.offNamed(AppRoutes.ENCONTRADOS);
          },
        ),
        const SizedBox(height: 10.0),
/*         MaterialButton(
          height: 60.0,
          padding: const EdgeInsets.all(0),
          textColor: Colors.black,
          minWidth: 60,
          child: Icon(
            Icons.add,
            size: 60,
          ),
          color: Colors.lightGreenAccent,
          elevation: 0,
          onPressed: () {
            Get.defaultDialog(
                title: "Elije una opcion:",
                backgroundColor: Colors.green[100],
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        FlatButton(
                            child: Text(
                              "   Perdidos   ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            splashColor: Colors.green,
                            color: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.deepPurple)),
                            onPressed: () {
                              Get.toNamed(AppRoutes.AGREGAR);
                            }),
                        FlatButton(
                            child: Text("Encontrados"),
                            splashColor: Colors.green,
                            color: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.deepPurple)),
                            onPressed: () {
                              Get.toNamed(AppRoutes.AGREGAR);
                            }),
                      ],
                    ),
                  )
                ]);
          },
        ), */
      ],
    );
  }
}
