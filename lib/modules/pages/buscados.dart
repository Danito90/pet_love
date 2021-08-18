import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_love/global_widgets/loading_widget.dart';
import 'package:pet_love/global_widgets/pet_controller.dart';
import 'package:pet_love/modules/local_widgets/drawer.dart';

import 'package:pet_love/routes/app_routes.dart';

class BuscadosPage extends GetView<PetController> {
  double h = Get.height;
  double w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Buscando Patitas"),
          shadowColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40)), //solo circular abajo
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.green[800],
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "actualizar.png",
                color: Colors.white,
                height: h * 0.05,
              ),
              tooltip: "Actualizar",
              onPressed: () {
                controller.getMascotasAll();
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_back, size: h * 0.05),
              tooltip: "Regresar",
              onPressed: () {
                controller.blanquear();
                Get.toNamed(AppRoutes.HOME);
              },
            ),
            Container(
              width: w * 0.02,
            )
          ],
        ),
        drawer: DrawerPet(),
        body: _informeBuscados(),
      ),
    );
  }

  Container _informeBuscados() {
    return Container(
      width: w,
      height: h,
      child: Obx(() => controller.status.value ==
              Status.loading // si esta cargando :
          ? LoadingWidget() //mientras muestra la carga
          : ListView.builder(
              // caundo carga carga la lista
              shrinkWrap: true,
              itemCount: controller.mascotasList.length,
/*                 Con shrinkWrap: true, puede cambiar este comportamiento para que 
                  ListView solo ocupe el espacio que necesita (seguirá desplazándose cuando haya más elementos). */
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      controller.IrItemMascotas(index);
                      /*  aca lo que estoy haciendo es guardar en la lista trabajo */
                      /* todos los datos que traemos en la base de datos para poder usarlo en la proxima pagina */

                      Get.toNamed(AppRoutes.PERFIL);
                    },
                    child: controller.mascotasList[index].buscado != true
                        ? Container()
                        : Container(
                            padding: EdgeInsets.only(
                                left: w * 0.007, right: w * 0.01),
                            margin: EdgeInsets.only(bottom: h * 0.005),
                            height: h * 0.3,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: w * 0.47,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: controller.mascotasList[index]
                                                          .profile ==
                                                      "" ||
                                                  controller.mascotasList[index]
                                                          .profile ==
                                                      null
                                              ? AssetImage("silueta.jpg")
                                              : NetworkImage(controller
                                                  .mascotasList[index].profile),
                                          fit: BoxFit.cover),
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(5.0, 5.0),
                                            blurRadius: 10.0)
                                      ]),
                                ),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: w * 0.47,
                                        margin:
                                            EdgeInsets.only(bottom: h * 0.005),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10.0),
                                                topRight:
                                                    Radius.circular(10.0)),
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 0.5, color: Colors.grey),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  offset: Offset(5.0, 5.0),
                                                  blurRadius: 10.0)
                                            ]),
                                        padding: EdgeInsets.all(w * 0.025),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                controller
                                                    .mascotasList[index].nombre,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: h * 0.01,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  controller
                                                      .mascotasList[index].raza,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16)),
                                            ),
                                            SizedBox(
                                              height: h * 0.005,
                                            ),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    controller
                                                        .mascotasList[index]
                                                        .genero,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ))),
                                            SizedBox(
                                              height: h * 0.005,
                                            ),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    controller
                                                        .mascotasList[index]
                                                        .edad,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ))),
                                            SizedBox(
                                              height: h * 0.005,
                                            ),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    "Perdido el " +
                                                        controller
                                                            .mascotasList[index]
                                                            .fecha,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ))),
                                            Expanded(
                                              child: controller
                                                              .mascotasList[
                                                                  index]
                                                              .whatsapp ==
                                                          null ||
                                                      controller
                                                              .mascotasList[
                                                                  index]
                                                              .whatsapp ==
                                                          ""
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                            "telefono.png",
                                                            height: h * 0.04),
                                                        Container(
                                                          width: w * 0.01,
                                                        ),
                                                        Text(
                                                            controller
                                                                .mascotasList[
                                                                    index]
                                                                .telefono
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                height: 1)),
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                            "whatsapp.png",
                                                            height: h * 0.04),
                                                        Container(
                                                          width: w * 0.01,
                                                        ),
                                                        Text(
                                                            controller
                                                                .mascotasList[
                                                                    index]
                                                                .whatsapp
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                height: 1)),
                                                      ],
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Image.asset(
                                            "editar.png",
                                            color: Colors.green[900],
                                          ),
                                          onPressed: () {
                                            controller.mascotas =
                                                controller.mascotasList[index];
                                            modificar();
                                            Get.toNamed(AppRoutes.AGREGAR,
                                                arguments: "Modificar a " +
                                                    controller.mascotas.nombre);
                                            if (controller.mascotasList[index]
                                                    .buscado ==
                                                true) {
                                              controller.mascotas.buscado =
                                                  true;
                                              controller.mascotas.encontrado =
                                                  false;
                                            } else {
                                              controller.mascotas.buscado =
                                                  false;
                                              controller.mascotas.encontrado =
                                                  true;
                                            }
                                          },
                                        ),
                                        Container(
                                          height: h * 0.04,
                                          width: w * 0.05,
                                        ),
                                        IconButton(
                                          icon: Image.asset(
                                            "eliminar.png",
                                            color: Colors.red[900],
                                          ),
                                          onPressed: () {
                                            Get.defaultDialog(
                                                title:
                                                    "¿Desea Eliminar la mascota?",
                                                backgroundColor:
                                                    Colors.green[100],
                                                actions: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Column(
                                                      children: [
                                                        Divider(
                                                          height: 25,
                                                          color: Colors.green
                                                              .withOpacity(
                                                                  0.40),
                                                          thickness: 2,
                                                        ),
                                                        FlatButton(
                                                            child: Text(
                                                              "   Aceptar   ",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            splashColor:
                                                                Colors.green,
                                                            color: Colors
                                                                .greenAccent,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .deepPurple)),
                                                            onPressed: () {
                                                              controller.eliminarMascota(
                                                                  controller
                                                                          .mascotasList[
                                                                      index]); //aca selecciono la mascota a eliminar
                                                              Get.back();
                                                            }),
                                                        Divider(
                                                          height: 25,
                                                          color: Colors.green
                                                              .withOpacity(
                                                                  0.40),
                                                          thickness: 2,
                                                        ),
                                                        FlatButton(
                                                            child: Text(
                                                              "  Cancelar  ",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            splashColor:
                                                                Colors.green,
                                                            color: Colors
                                                                .greenAccent,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .deepPurple)),
                                                            onPressed: () {
                                                              Get.back();
                                                            }),
                                                      ],
                                                    ),
                                                  )
                                                ]);
                                            /*   controller.eliminarMascota(controller
                                              .mascotasList[
                                          index]); //aca selecciono la mascota a eliminar
                                     */
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                  ),
                );
              })),
    );
  }

  modificar() {
    controller.catdog.value = controller.mascotas.tipo; //tipo

    controller.mascotas.raza == "Perro"
        ? controller.combob.value = controller.mascotas.raza
        : controller.comboGato.value = controller.mascotas.raza; //raza
    controller.genero.value = controller.mascotas.genero; //genero
    controller.collarSiNo.value = controller.mascotas.collar; //collar
    controller.tamaos.value = controller.mascotas.tamao; //tamaño
    controller.edades.value = controller.mascotas.edad; //edad
    controller.fecha.value = controller.mascotas.fecha; //fecha
    controller
        .colorSelec1(Color(int.parse(controller.mascotas.color1))); //color1
    controller
        .colorSelec2(Color(int.parse(controller.mascotas.color2))); //color2
    controller
        .colorSelec3(Color(int.parse(controller.mascotas.color3))); //color3
  }

  showDialog(String titulo, String error) {
    Get.defaultDialog(
      title: titulo,
      content: Text(error),
      onCancel: () => print("cancelar"),
      textCancel: 'Aceptar',
      //textConfirm: 'Enviar',
      //buttonColor: Colors.deepPurple,
      //onConfirm: () => print("Ok"),
      //confirmTextColor: Colors.orange,
      //backgroundColor: Colors.white,
      radius: 5.0,
      //middleTextStyle: TextStyle(fontSize: 5.0, fontWeight: FontWeight.bold),
    );
  }
}
