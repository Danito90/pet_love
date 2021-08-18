import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_love/data/model/mascotas_model.dart';
import 'package:pet_love/data/repository/pet_repository.dart';
import 'package:pet_love/routes/app_routes.dart';
import 'package:pet_love/utils/colores.dart';
import 'package:pet_love/utils/extra_reactivos.dart';

enum Status { loading, success, error }

class PetController extends GetxController {
  final MascotasRepository petRepository;

  PetController({this.petRepository});

  Rx<Colores1> colores1;
  Rx<Colores2> colores2;
  Rx<Colores3> colores3;

  Rx<Extras> extras;
  Rx<Extras> extras1;
  Rx<Extras> extras2;
  Rx<Extras> extras3;
  Rx<Extras> extras4;
  Rx<Extras> extras5;
  Rx<Extras> extras6;
  Rx<Extras> extras7;

  RxBool switchTheme = false.obs;
  RxString edades = "Cachorro".obs; //para Radio de seleccion edad
  RxString tamaos = "Pequeño".obs; //para Radio de seleccion tamaño
  RxString catdog = "Perro".obs;
  RxString genero = "Macho".obs;
  RxBool collarSiNo = false.obs;
  var combob = "Callejero".obs;
  var comboGato = "Callejero".obs;
  var fecha = "  /  /    ".obs;

  final _mascotasList = <Mascotas>[].obs;

  get mascotasList => this._mascotasList.value; //recibimos lista mascotas
  set mascotasList(value) => this._mascotasList.value = value; //enviamos

  final status = Status.loading.obs;

  final _mascotas = Mascotas().obs;

  get mascotas => this._mascotas.value;
  set mascotas(value) => this._mascotas.value = value;

  /// When the controller is initialized, make the http request
  @override
  void onInit() {
    /*   print("Iniciando"); //para ver en consola si inicia */
    getMascotasAll();
    super.onInit();
    mascotas.genero = "Macho";
    mascotas.raza = "Callejero";
    mascotas.tipo = "Perro";
    mascotas.collar = false;
    mascotas.tamao = "Pequeño";
    mascotas.edad = "Cachorro";
    mascotas.fecha = "(Sin dato)";

    extras = Extras(
      imagenP: null,
    ).obs;
    extras1 = Extras(
      imagenP: null,
    ).obs;
    extras2 = Extras(
      imagenP: null,
    ).obs;
    extras3 = Extras(
      imagenP: null,
    ).obs;
    extras4 = Extras(
      imagenP: null,
    ).obs;
    extras5 = Extras(
      imagenP: null,
    ).obs;
    extras6 = Extras(
      imagenP: null,
    ).obs;
    extras7 = Extras(
      imagenP: null,
    ).obs;

    colores1 = Colores1(
      colorSeleccionado1: Color(0x00000000),
    ).obs;
    colores2 = Colores2(
      colorSeleccionado2: Color(0x00000000),
    ).obs;
    colores3 = Colores3(
      colorSeleccionado3: Color(0x00000000),
    ).obs;
  }

  void imagenesCarga(File _imagen) {
    extras.value = Extras(imagenP: _imagen);
  }

  void imagenesCarga1(File _imagen) {
    extras1.value = Extras(imagenP: _imagen);
  }

  void imagenesCarga2(File _imagen) {
    extras2.value = Extras(imagenP: _imagen);
  }

  void imagenesCarga3(File _imagen) {
    extras3.value = Extras(imagenP: _imagen);
  }

  void imagenesCarga4(File _imagen) {
    extras4.value = Extras(imagenP: _imagen);
  }

  void imagenesCarga5(File _imagen) {
    extras5.value = Extras(imagenP: _imagen);
  }

  void imagenesCarga6(File _imagen) {
    extras6.value = Extras(imagenP: _imagen);
  }

  void imagenesCarga7(File _imagen) {
    extras7.value = Extras(imagenP: _imagen);
  }

  void colorSelec1(Color _color1) {
    colores1.value = Colores1(
      colorSeleccionado1: _color1,
    );
  }

  void colorSelec2(Color _color2) {
    colores2.value = Colores2(
      colorSeleccionado2: _color2,
    );
  }

  void colorSelec3(Color _color3) {
    colores3.value = Colores3(
      colorSeleccionado3: _color3,
    );
  }

  IrItemMascotas(index) {
    this.mascotas = this.mascotasList[index];

    Get.toNamed(AppRoutes.AGREGAR);
  }

  blanquear() {
    mascotas.genero = "Macho";
    mascotas.raza = "Callejero";
    mascotas.tipo = "Perro";
    mascotas.tamao = "Pequeño";
    mascotas.edad = "Cachorro";
    mascotas.fecha = "(Sin dato)";
    mascotas.id = "";
    mascotas.nombre = "";
    mascotas.color1 = "0x00000000";
    mascotas.color2 = "0x00000000";
    mascotas.color3 = "0x00000000";
    mascotas.collar = false;
    mascotas.profile = "";
    mascotas.imagen001 = "";
    mascotas.imagen002 = "";
    mascotas.imagen003 = "";
    mascotas.imagen004 = "";
    mascotas.imagen005 = "";
    mascotas.imagen006 = "";
    mascotas.imagen007 = "";
    mascotas.telefono = "";
    mascotas.direccion = "";
    mascotas.adopcion = false;
    /*  mascotas.buscado = false;
    mascotas.encontrado = false; */
    mascotas.reencuentro = false;
    mascotas.lovi = 0;
    mascotas.triste = 0;
    mascotas.mail = "";
    mascotas.whatsapp = "";
    mascotas.comentarios = "";
    mascotas.extra1 = "";
    mascotas.extra2 = "";
    mascotas.extra3 = "";
    mascotas.extra4 = "";
    mascotas.extra5 = "";
  }

  Future<void> getMascotasAll() async {
    return petRepository.getMascotas().then(
      //recibe la lista de mascotas
      (data) {
        this.mascotasList = data;
        status(Status.success);
      },

      /// In case of error, print the error and change the status
      /// to Status.error
      onError: (err) {
        print("$err");
        return status(Status.error);
      },
    );
  }

  Future<void> crearMascota(Mascotas mascota) async {
    try {
      await petRepository.crearMascotas(mascota);

      getMascotasAll();
    } catch (e) {
      print(e);
    }
  }

  Future<void> modificarMascota(Mascotas mascota) async {
    try {
      await petRepository.modificarMascotas(mascota);
      getMascotasAll();
    } catch (e) {
      print(e);
    }
  }

  Future<void> eliminarMascota(Mascotas mascota) async {
    try {
      await petRepository.eliminarMascotas(mascota);
      getMascotasAll();
    } catch (e) {
      print(e);
    }
  }
}
