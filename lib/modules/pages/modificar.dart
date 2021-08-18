import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:pet_love/global_widgets/pet_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet_love/routes/app_routes.dart';
import 'package:image_picker/image_picker.dart';

class AgregarPage extends GetView<PetController> {
  final _formKey = GlobalKey<FormState>();
  bool guardado = true;
  bool guardado1 = true;
  bool guardado2 = true;
  bool guardado3 = true;
  bool guardado4 = true;
  bool guardado5 = true;
  bool guardado6 = true;
  bool guardado7 = true;
  double h = Get.height;
  double w = Get.width;

  //controladores de texto
  var _contNombre = TextEditingController();
  var _contComent = TextEditingController();
  var _ubi = TextEditingController();
  var _telefono = TextEditingController();
  var _whatsapp = TextEditingController();
  var _mail = TextEditingController();
  final picker = ImagePicker();
  String url;
  File sampleImage;
  File sampleImage1;
  File sampleImage2;
  File sampleImage3;
  File sampleImage4;
  File sampleImage5;
  File sampleImage6;
  File sampleImage7;

  DateTime selectedDate = DateTime.now();
  String localidad = "";
  String ciudad = "";
  String provincia = "";

  @override
  Widget build(BuildContext context) {
    return /* Obx(
      () => */
        Column(
      children: [
        Container(
            width: w,
            height: h * 0.9,
            child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(CupertinoIcons.back),
                    onPressed: () {
                      _blanqueo();
                      controller.blanquear();
                      controller.getMascotasAll();

                      Get.arguments == "Agregar buscado" ||
                              Get.arguments == "Agregar encontrado"
                          ? Get.toNamed(AppRoutes.HOME)
                          : controller.mascotas.buscado == true
                              ? Get.toNamed(AppRoutes.BUSCADOS)
                              : Get.toNamed(AppRoutes.ENCONTRADOS);
                      /*  Get.arguments == "Agregar buscado" ||
                                  Get.arguments == "Agregar encontrado"
                              ? Get.toNamed(AppRoutes.HOME)
                              : Get.toNamed(AppRoutes.BUSCADOS); */
                    },
                  ),
                  automaticallyImplyLeading: false,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(40)), //solo circular abajo
                  ),
                  toolbarHeight: 100,
                  title: Text(
                      "${Get.arguments != null ? Get.arguments : 'Agregar/Modificar'}"),
                ),
                backgroundColor: Colors.white,
                body: Container(
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.80), //here i want to add opacity
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Container(
                            width: w * 0.95,
                            child: Column(
                              children: [
                                _perfil(),
                                _nombre(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _catdog(),
                                    _raza(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [_genero(), _collar()],
                                ),
                                _tamao(),
                                Container(
                                  width: w * 0.98,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      _edad(),
                                      //==selector fecha==
                                      Container(
                                        height: h * 0.11,
                                        width: w * 0.43,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  offset: Offset(5.0, 5.0),
                                                  blurRadius: 10.0)
                                            ],
                                            color: Colors.lightBlueAccent,
                                            border: Border.all(
                                              color: Colors.black87,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(15.0),
                                                topRight:
                                                    const Radius.circular(15.0),
                                                bottomLeft:
                                                    const Radius.circular(15.0),
                                                bottomRight:
                                                    const Radius.circular(
                                                        15.0))),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: h * 0.002,
                                            ),
                                            controller.mascotas.buscado == true
                                                ? Text(
                                                    "Fecha de extravio:",
                                                    style: TextStyle(
                                                        fontSize: h * 0.02,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : Text(
                                                    "Fecha de encuentro:",
                                                    style: TextStyle(
                                                        fontSize: h * 0.02,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: w * 0.02,
                                                ),
                                                IconButton(
                                                    icon: Icon(FontAwesomeIcons
                                                        .solidCalendarAlt),
                                                    onPressed: () async {
                                                      _selectDate(context);
                                                    }),
                                                Obx(
                                                  () => new Text(
                                                    "${controller.fecha.value}",
                                                    style: TextStyle(
                                                        fontSize: h * 0.025,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      //====================
                                    ],
                                  ),
                                ),
                                _colores(),
                                _ubicacion(),
                                _contacto(),
                                _foto(),
                                _comentarios(),
                                /* _botonPublicar(), */
                                Container(
                                  height: h * 0.02,
                                )
                              ],
                            )),
                      ),
                    )))),
        Container(
          color: Colors.blue,
          width: w,
          height: h * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _botonPublicar(),
            ],
          ),
        )
      ],
    );
  }

  Future _subirProfileGallery() async {
    await Firebase.initializeApp(); //inicializa Firestore usar siempre
    if (sampleImage == null) {
      controller.mascotas.profile == ""
          ? controller.mascotas.profile = ""
          : controller.mascotas.profile = controller.mascotas.profile;
    } else {
      if (guardado == true) {
        //subir imagen a firebase Storage
        var imageName = Uuid().v1(); //da nombre unico a cada imagen
        /* var path = "/Users/$imageName.jpg"; */

        final Reference postIamgeRef = FirebaseStorage.instance
            .ref()
            .child("Usuarios"); //creamos carpeta en firebase storage
/*     var timeKey = DateTime.now(); */
        final UploadTask uploadTask = postIamgeRef
            .child(imageName.toString() + ".jpg")
            .putFile(
                sampleImage); //le damos nombre unico a la imagen con la fecha y horario de carga
        var imageUrl = await (await uploadTask) // se elimini el .onComplete
            .ref
            .getDownloadURL(); //obtengo url de la imagen subida a storage
        url = imageUrl
            .toString(); //la imagen la convierto a String y la paso a la variable url
        /*   print("Image" + url);
    print("sample" + " $sampleImage"); */
        //guardar el post a firebase database: database realtime

        /*   controller.extras?.value == null
          ? controller.mascotas.profile = ""
          : */
        controller.mascotas.profile = url;
      }
    }
    //imagen 001
    if (sampleImage1 == null) {
      controller.mascotas.imagen001 == ""
          ? controller.mascotas.imagen001 = ""
          : controller.mascotas.imagen001 = controller.mascotas.imagen001;
    } else {
      if (guardado1 == true) {
        var imageName = Uuid().v1();

        final Reference postIamgeRef =
            FirebaseStorage.instance.ref().child("Usuarios");
        final UploadTask uploadTask = postIamgeRef
            .child(imageName.toString() + ".jpg")
            .putFile(sampleImage1);
        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        url = imageUrl.toString();
        controller.mascotas.imagen001 = url;
      }
    }

    //imagen 002
    if (sampleImage2 == null) {
      controller.mascotas.imagen002 == ""
          ? controller.mascotas.imagen002 = ""
          : controller.mascotas.imagen002 = controller.mascotas.imagen002;
    } else {
      if (guardado2 == true) {
        var imageName = Uuid().v1();

        final Reference postIamgeRef =
            FirebaseStorage.instance.ref().child("Usuarios");
        final UploadTask uploadTask = postIamgeRef
            .child(imageName.toString() + ".jpg")
            .putFile(sampleImage2);
        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        url = imageUrl.toString();
        controller.mascotas.imagen002 = url;
      }
    }

    //imagen 003

    if (sampleImage3 == null) {
      controller.mascotas.imagen003 == ""
          ? controller.mascotas.imagen003 = ""
          : controller.mascotas.imagen003 = controller.mascotas.imagen003;
    } else {
      if (guardado3 == true) {
        var imageName = Uuid().v1();

        final Reference postIamgeRef =
            FirebaseStorage.instance.ref().child("Usuarios");
        final UploadTask uploadTask = postIamgeRef
            .child(imageName.toString() + ".jpg")
            .putFile(sampleImage3);
        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        url = imageUrl.toString();
        controller.mascotas.imagen003 = url;
      }
    }

    //imagen 004

    if (sampleImage4 == null) {
      controller.mascotas.imagen004 == ""
          ? controller.mascotas.imagen004 = ""
          : controller.mascotas.imagen004 = controller.mascotas.imagen004;
    } else {
      if (guardado4 == true) {
        var imageName = Uuid().v1();

        final Reference postIamgeRef =
            FirebaseStorage.instance.ref().child("Usuarios");
        final UploadTask uploadTask = postIamgeRef
            .child(imageName.toString() + ".jpg")
            .putFile(sampleImage4);
        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        url = imageUrl
            .toString(); //la imagen la convierto a String y la paso a la variable url
        /*   print("Image" + url);
    print("sample" + " $sampleImage4"); */
        //guardar el post a firebase database: database realtime
        controller.mascotas.imagen004 = url;
      }
    }
    //imagen 005

    if (sampleImage5 == null) {
      controller.mascotas.imagen005 == ""
          ? controller.mascotas.imagen005 = ""
          : controller.mascotas.imagen005 = controller.mascotas.imagen005;
    } else {
      if (guardado5 == true) {
        var imageName = Uuid().v1();

        final Reference postIamgeRef =
            FirebaseStorage.instance.ref().child("Usuarios");
        final UploadTask uploadTask = postIamgeRef
            .child(imageName.toString() + ".jpg")
            .putFile(sampleImage5);
        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        url = imageUrl.toString();
        controller.mascotas.imagen005 = url;
      }
    }
    //imagen 006

    if (sampleImage6 == null) {
      controller.mascotas.imagen006 == ""
          ? controller.mascotas.imagen006 = ""
          : controller.mascotas.imagen006 = controller.mascotas.imagen006;
    } else {
      if (guardado6 == true) {
        var imageName = Uuid().v1();

        final Reference postIamgeRef =
            FirebaseStorage.instance.ref().child("Usuarios");
        final UploadTask uploadTask = postIamgeRef
            .child(imageName.toString() + ".jpg")
            .putFile(sampleImage6);
        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        url = imageUrl.toString();
        controller.mascotas.imagen006 = url;
      }
    }
//imagen 007

    if (sampleImage7 == null) {
      controller.mascotas.imagen007 == ""
          ? controller.mascotas.imagen007 = ""
          : controller.mascotas.imagen007 = controller.mascotas.imagen007;
    } else {
      if (guardado7 == true) {
        var imageName = Uuid().v1();

        final Reference postIamgeRef =
            FirebaseStorage.instance.ref().child("Usuarios");
        final UploadTask uploadTask = postIamgeRef
            .child(imageName.toString() + ".jpg")
            .putFile(sampleImage7);
        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        url = imageUrl.toString();
        controller.mascotas.imagen007 = url;
      }
    }
  }

  Future getImage() async {
    var tempImage = await picker.getImage(source: ImageSource.gallery);
    sampleImage = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga(File(tempImage.path));
  }

  Future getImagePhoto() async {
    var tempImage = await picker.getImage(source: ImageSource.camera);
    sampleImage = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga(File(tempImage.path));
/*     print(controller.mascotas.profile);
    print(File(tempImage.path)); */
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return 'El nombre es requerido';
    }
    final nameExp = RegExp(r'^[A-Za-z áéíóúñ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'caracteres incorrectos';
    }
    return null;
  }

  String _validateDireccion(String value) {
    if (value.isEmpty) {
      return 'La dirección es requerida';
    }
    final nameExp = RegExp(r'^[A-Za-z 0-9,; áéíóúñ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'caracteres incorrectos';
    }
    return null;
  }

  String _validateComent(String value) {
    if (value.isEmpty) {
      return 'El comentario es requerido';
    }
    final nameExp = RegExp(r'^[A-Za-z0-9 áéíóúñ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'caracteres incorrectos';
    }
    return null;
  }

  String _validatePhoneNumber(String value) {
    if (value.trim().length >= 7) {
      return null;
    }
    return 'Invalido';
  }

  String _validateEmail(String value) {
    if (value.contains('@')) {
      return null;
    }
    return 'Email no válido';
  }

  Widget _catdog() {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: h * 0.11,
              width: w * 0.36,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0)
                  ],
                  border: Border.all(
                    color: Colors.black87,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                      bottomLeft: const Radius.circular(15.0),
                      bottomRight: const Radius.circular(15.0))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.dog,
                            size: h * 0.035,
                            color: Colors.black,
                          ),
                          Container(
                            width: w * 0.04,
                          ),
                          Icon(
                            FontAwesomeIcons.cat,
                            size: h * 0.035,
                            color: Colors.black,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*          Text(
                          "Perro",
                          style: TextStyle(
                              //detalle de labeltext
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.02),
                        ), */
                        Radio(
                            activeColor: Colors.red[800],
                            value: "Perro",
                            groupValue: controller.catdog.value,
                            onChanged: (value) {
                              controller.catdog.value = value;
                              controller.mascotas.tipo = value;
                            }),
                        /*  Text(
                          "Gato",
                          style: TextStyle(
                              //detalle de labeltext
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.02),
                        ), */
                        Radio(
                            activeColor: Colors.red[800],
                            value: "Gato",
                            groupValue: controller.catdog.value,
                            onChanged: (value) {
                              controller.catdog.value = value;
                              controller.mascotas.tipo = value;
                            }),
                      ],
                    ),
                  ])),
        ));
  }

  Widget _genero() {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: h * 0.11,
              width: w * 0.45,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0)
                  ],
                  color: Colors.lightBlueAccent,
                  border: Border.all(
                    color: Colors.black87,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                      bottomLeft: const Radius.circular(15.0),
                      bottomRight: const Radius.circular(15.0))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: h * 0.035,
                            color: Colors.black,
                          ),
                          Container(
                            width: w * 0.08,
                          ),
                          Icon(
                            FontAwesomeIcons.venus,
                            size: h * 0.035,
                            color: Colors.black,
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "M",
                          style: TextStyle(
                              //detalle de labeltext
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.02),
                        ),
                        Radio(
                            activeColor: Colors.red[800],
                            value: "Macho",
                            groupValue: controller.genero.value,
                            onChanged: (value) {
                              controller.genero.value = value;
                              controller.mascotas.genero = value;
                            }),
                        Text(
                          "H",
                          style: TextStyle(
                              //detalle de labeltext
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.02),
                        ),
                        Radio(
                            activeColor: Colors.red[800],
                            value: "Hembra",
                            groupValue: controller.genero.value,
                            onChanged: (value) {
                              controller.genero.value = value;
                              controller.mascotas.genero = value;
                            }),
                      ],
                    ),
                  ])),
        ));
  }

  Widget _nombre() {
    _contNombre = TextEditingController(
      text: controller.mascotas.nombre.toString(),
    );
    return Column(children: [
      SizedBox(
        height: h * 0.02,
      ),
      Row(children: [
        Container(
          width: w * 0.02,
        ),
        Container(
          width: w * 0.97,
          child: TextFormField(
            controller: _contNombre,
            maxLength: 15,
            keyboardType: TextInputType.name,
            textCapitalization:
                TextCapitalization.words, //mayuscula para cada palabra
            decoration: InputDecoration(
              labelStyle: TextStyle(
                  //detalle de labeltext
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: h * 0.025),
              enabledBorder: OutlineInputBorder(

                  //detalle con bordeactivo
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(60))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              filled: true,
              icon: Icon(FontAwesomeIcons.fileSignature, size: h * 0.03),
              hintText: "  Ej: Toby",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              fillColor: Colors.lightBlueAccent,
              labelText: "  Nombre:",
            ),
            onSaved: (value) {
              controller.mascotas.nombre = value.toString();
            },
            validator:
                controller.mascotas.buscado == true ? _validateName : null,
          ),
        ),
      ]),
    ]);
  }

  Widget _edad() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: h * 0.11,
          width: w * 0.50,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                    blurRadius: 10.0)
              ],
              color: Colors.lightBlueAccent,
              border: Border.all(
                color: Colors.black87,
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15.0),
                  topRight: const Radius.circular(15.0),
                  bottomLeft: const Radius.circular(15.0),
                  bottomRight: const Radius.circular(15.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: w * 0.008,
              ),
              Column(
                children: [
                  SizedBox(
                    height: h * 0.002,
                  ),
                  Text(
                    "Edad:",
                    style: TextStyle(
                        //detalle de labeltext
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.025),
                  ),
                  SizedBox(
                    height: h * 0.008,
                  ),
                  Icon(
                    FontAwesomeIcons.birthdayCake,
                    size: h * 0.03,
                    color: Colors.black,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cachorro",
                    style: TextStyle(
                        //detalle de labeltext
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.02),
                  ),
                  Radio(
                      activeColor: Colors.red[800],
                      value: "Cachorro",
                      groupValue: controller.edades.value,
                      onChanged: (value) {
                        controller.edades.value = value;
                        controller.mascotas.edad = value;
                      }),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Adulto",
                    style: TextStyle(
                        //detalle de labeltext
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.02),
                  ),
                  Radio(
                      activeColor: Colors.red[800],
                      value: "Adulto",
                      groupValue: controller.edades.value,
                      onChanged: (value) {
                        controller.edades.value = value;
                        controller.mascotas.edad = value;
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tamao() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: h * 0.11,
          width: w * 0.97,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                    blurRadius: 10.0)
              ],
              color: Colors.lightBlueAccent,
              border: Border.all(
                color: Colors.black87,
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15.0),
                  topRight: const Radius.circular(15.0),
                  bottomLeft: const Radius.circular(15.0),
                  bottomRight: const Radius.circular(15.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.arrowsAlt,
                size: h * 0.03,
                color: Colors.black,
              ),
              Text(
                "Tamaño:",
                style: TextStyle(
                    //detalle de labeltext
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.025),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pequeño",
                    style: TextStyle(
                        //detalle de labeltext
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.02),
                  ),
                  Radio(
                      activeColor: Colors.red[800],
                      value: "Pequeño",
                      groupValue: controller.tamaos.value,
                      onChanged: (value) {
                        controller.tamaos.value = value;
                        controller.mascotas.tamao = value;
                      }),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mediano",
                    style: TextStyle(
                        //detalle de labeltext
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.02),
                  ),
                  Radio(
                      activeColor: Colors.red[800],
                      value: "Mediano",
                      groupValue: controller.tamaos.value,
                      onChanged: (value) {
                        controller.tamaos.value = value;
                        controller.mascotas.tamao = value;
                      }),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Grande",
                    style: TextStyle(
                        //detalle de labeltext
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.02),
                  ),
                  Radio(
                      activeColor: Colors.red[800],
                      value: "Grande",
                      groupValue: controller.tamaos.value,
                      onChanged: (value) {
                        controller.tamaos.value = value;
                        controller.mascotas.tamao = value;
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _colores() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h * 0.11,
        width: w * 0.97,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0)
            ],
            color: Colors.lightBlueAccent,
            border: Border.all(
              color: Colors.black87,
              width: 2,
            ),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
                bottomLeft: const Radius.circular(15.0),
                bottomRight: const Radius.circular(15.0))),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.palette,
                size: h * 0.03,
                color: Colors.black,
              ),
              Text(
                "Colores:",
                style: TextStyle(
                    //detalle de labeltext
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.025),
              ),
              GestureDetector(
                child:
                    _container(controller.colores1.value?.colorSeleccionado1),
                onTap: () {
                  Get.defaultDialog(
                      backgroundColor: Colors.cyan[100],
                      titleStyle: TextStyle(color: Colors.black),
                      title: "Seleccionar color: ",
                      actions: [
                        _selector1(),
                        Container(
                          width: w * 0.02,
                        ),
                      ]);
                },
              ),
              GestureDetector(
                child:
                    _container(controller.colores2.value?.colorSeleccionado2),
                onTap: () {
                  Get.defaultDialog(
                      backgroundColor: Colors.cyan[100],
                      titleStyle: TextStyle(color: Colors.black),
                      title: "Seleccionar color: ",
                      actions: [
                        _selector2(),
                        Container(
                          width: w * 0.02,
                        ),
                      ]);
                },
              ),
              GestureDetector(
                child:
                    _container(controller.colores3.value?.colorSeleccionado3),
                onTap: () {
                  Get.defaultDialog(
                      backgroundColor: Colors.cyan[100],
                      titleStyle: TextStyle(color: Colors.black),
                      title: "Seleccionar color: ",
                      actions: [
                        _selector3(),
                        Container(
                          width: w * 0.02,
                        ),
                      ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _collar() {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: h * 0.11,
              width: w * 0.45,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0)
                  ],
                  color: Colors.lightBlueAccent,
                  border: Border.all(
                    color: Colors.black87,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                      bottomLeft: const Radius.circular(15.0),
                      bottomRight: const Radius.circular(15.0))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "dog-collar.png",
                            height: h * 0.035,
                          ),
                          Container(
                            width: w * 0.02,
                          ),
                          Text(
                            "Llevaba collar?",
                            style: TextStyle(
                                //detalle de labeltext
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: h * 0.02),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "No",
                          style: TextStyle(
                              //detalle de labeltext
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.02),
                        ),
                        Radio(
                            activeColor: Colors.red[800],
                            value: false,
                            groupValue: controller.collarSiNo.value,
                            onChanged: (value) {
                              controller.collarSiNo.value = value;
                              controller.mascotas.collar = value;
                            }),
                        Text(
                          "Si",
                          style: TextStyle(
                              //detalle de labeltext
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.02),
                        ),
                        Radio(
                            activeColor: Colors.red[800],
                            value: true,
                            groupValue: controller.collarSiNo.value,
                            onChanged: (value) {
                              controller.collarSiNo.value = value;
                              controller.mascotas.collar = value;
                            }),
                      ],
                    ),
                  ])),
        ));
  }

  Widget _raza() {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: h * 0.11,
            width: w * 0.55,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0)
                ],
                color: Colors.lightBlueAccent,
                border: Border.all(
                  color: Colors.black87,
                  width: 2,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.catdog.value == "Perro"
                            ? Image.asset(
                                "dog.png",
                                height: h * 0.035,
                              )
                            : Image.asset(
                                "gato-domestico.png",
                                height: h * 0.035,
                              ),
                        Container(
                          width: w * 0.06,
                        ),
                        Text(
                          "Raza:",
                          style: TextStyle(
                              //detalle de labeltext
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.024),
                        ),
                      ],
                    ),
                    Container(
                      width: w * 0.02,
                    ),
                    controller.catdog.value == "Perro"
                        ? DropdownButton<String>(
                            value: controller.combob.value,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            iconEnabledColor: Colors.black,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String newValue) {
                              controller.mascotas.raza = newValue;
                              controller.combob.value = newValue;
                            },
                            items: <String>[
                              'Alaskan Malamute',
                              'Bichon Maltes',
                              'Border Collie',
                              'Boxer',
                              'Boyero de Berna',
                              'Braco Aleman',
                              'Bull Terrier',
                              'Bulldog Frances',
                              'Callejero',
                              'Caniche',
                              'Chihuahua',
                              'Chow Chow',
                              'Dalmata',
                              'Dobermann',
                              'Dogo Argentino',
                              'Galgo',
                              'Golden',
                              'Gran Danes',
                              'Husky Siberiano',
                              'Labrador',
                              'Mastin Napolitano',
                              'Otra raza',
                              'Ovejero Aleman',
                              'Ovejero Belga',
                              'Pastor Australiano',
                              'Pastor Blanco Suizo',
                              'Pitbull',
                              'Pointer',
                              'Pomerania',
                              'Rhodesian Ridgeback',
                              'Rottweiler',
                              'San Bernardo',
                              'Schnauzer',
                              'Shar Pei',
                              'Terranova',
                              'Weimaraner',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList())
                        : DropdownButton<String>(
                            value: controller.comboGato.value,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            iconEnabledColor: Colors.black,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String newValue) {
                              controller.mascotas.raza = newValue;
                              controller.comboGato.value = newValue;
                            },
                            items: <String>[
                              'Callejero',
                              'Siames',
                              'Angora',
                              'Otra raza',
                              'Siberiano',
                              'Persa'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      locale: const Locale('es', 'es_AR'),
      //locale: Locale('es', 'es_AR'),
      //initialDate: selectedDate,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      //initialEntryMode: DatePickerEntryMode.input,
      //initialDatePickerMode: DatePickerMode.day,
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      /* print(picked.toString()); */
      String fecha_v = DateFormat("dd/MM/yyyy")
          .format(DateTime.parse(selectedDate.toString()))
          .toString();

      controller.mascotas.fecha = fecha_v;
      controller.fecha.value = fecha_v;
    }
  }

  Widget _ubicacion() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h * 0.13,
        width: w * 0.97,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0)
            ],
            color: Colors.lightBlueAccent,
            border: Border.all(
              color: Colors.black87,
              width: 2,
            ),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
                bottomLeft: const Radius.circular(15.0),
                bottomRight: const Radius.circular(15.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: w * 0.01,
            ),
            Image.asset("posicion.png", height: h * 0.035),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "   Ubicacion:",
                  style: TextStyle(
                      //detalle de labeltext
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: h * 0.025),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _textUbi(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _textUbi() {
    _ubi =
        TextEditingController(text: controller.mascotas.direccion.toString());
    return Container(
      width: w * 0.80,
      child: TextFormField(
        controller: _ubi,
        maxLength: 50,
        keyboardType: TextInputType.streetAddress,
        textCapitalization:
            TextCapitalization.words, //mayuscula para cada palabra
        decoration: InputDecoration(
          labelStyle: TextStyle(
              //detalle de labeltext
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: h * 0.015),
          filled: true,
          hintText: "Ej: La Colonia, Junin, Mendoza",
          hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: h * 0.017),
          fillColor: Colors.lightBlueAccent,
        ),
        onSaved: (value) {
          controller.mascotas.direccion = value.toString();
        },
        validator: _validateDireccion,
      ),
    );
  }

  Widget _contacto() {
    _whatsapp = TextEditingController(
      text: controller.mascotas.whatsapp.toString(),
    );
    _telefono = TextEditingController(
      text: controller.mascotas.telefono.toString(),
    );
    _mail = TextEditingController(
      text: controller.mascotas.mail.toString(),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h * 0.302,
        width: w * 0.97,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0)
            ],
            color: Colors.lightBlueAccent,
            border: Border.all(
              color: Colors.black87,
              width: 2,
            ),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
                bottomLeft: const Radius.circular(15.0),
                bottomRight: const Radius.circular(15.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: w * 0.01,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * 0.01,
                ),
                Text(
                  "   Contacto:",
                  style: TextStyle(
                      //detalle de labeltext
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: h * 0.025),
                ),
                Container(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: w * 0.45,
                          child: TextFormField(
                            controller: _telefono,
                            maxLength: 16,
                            keyboardType: TextInputType.phone,
                            textCapitalization: TextCapitalization
                                .words, //mayuscula para cada palabra
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  //detalle de labeltext
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: h * 0.025),
                              enabledBorder: OutlineInputBorder(
                                  //detalle con bordeactivo
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              filled: true,
                              icon: Image.asset("telefono.png",
                                  height: h * 0.035),
                              hintText: "Ej: 263-4436574",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: h * 0.015),
                              fillColor: Colors.lightBlueAccent,
                              labelText: "Telefono:",
                            ),
                            onSaved: (value) {
                              controller.mascotas.telefono = value.toString();
                            },
                            validator: _validatePhoneNumber,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: w * 0.03,
                    ),
                    Column(
                      children: [
                        Container(
                          width: w * 0.45,
                          child: TextFormField(
                            controller: _whatsapp,
                            maxLength: 16,
                            keyboardType: TextInputType.phone,
                            textCapitalization: TextCapitalization
                                .words, //mayuscula para cada palabra
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  //detalle de labeltext
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: h * 0.025),
                              enabledBorder: OutlineInputBorder(
                                  //detalle con bordeactivo
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              filled: true,
                              icon:
                                  Image.asset("whatsapp.png", height: h * 0.04),
                              hintText: "Ej: 263-4487563",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: h * 0.015),
                              fillColor: Colors.lightBlueAccent,
                              labelText: "Whatsapp:",
                            ),
                            onSaved: (value) {
                              controller.mascotas.whatsapp = value.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: h * 0.02,
                ),
                Column(
                  children: [
                    Container(
                      width: w * 0.93,
                      child: TextFormField(
                        controller: _mail,
                        maxLength: 40,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization
                            .words, //mayuscula para cada palabra
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              //detalle de labeltext
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.025),
                          enabledBorder: OutlineInputBorder(
                              //detalle con bordeactivo
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          filled: true,
                          icon: Image.asset("email.png", height: h * 0.035),
                          hintText: "Ej: mailfalso@mail.com",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          fillColor: Colors.lightBlueAccent,
                          labelText: "Email:",
                        ),
                        onSaved: (value) {
                          controller.mascotas.mail = value.toString();
                        },
                        validator: _validateEmail,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _comentarios() {
    _contComent = TextEditingController(
      text: controller.mascotas.comentarios.toString(),
    );
    return Column(children: [
      SizedBox(
        height: h * 0.02,
      ),
      Row(children: [
        Container(
          width: w * 0.02,
        ),
        Container(
          width: w * 0.96,
          child: TextFormField(
            maxLines: 5,
            controller: _contComent,
            maxLength: 150,
            keyboardType: TextInputType.text,
            textCapitalization:
                TextCapitalization.sentences, //mayuscula para cada palabra
            decoration: InputDecoration(
              helperMaxLines: 5,
              labelStyle: TextStyle(
                  //detalle de labeltext
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: h * 0.025),
              enabledBorder: OutlineInputBorder(
                  //detalle con bordeactivo
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              filled: true,
              icon: Image.asset(
                "comentario.png",
                height: h * 0.045,
              ),
              hintText: "  Ej: Tiene un collar color negro",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              fillColor: Colors.lightBlueAccent,
              labelText: "  Comentarios:",
            ),
            onSaved: (value) {
              controller.mascotas.comentarios = value.toString();
            },
          ),
        ),
      ]),
    ]);
  }

  Widget _selector1() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: _container(Color(0xffffffff)),
              onTap: () {
                controller.colorSelec1(Colors.white);
                controller.mascotas.color1 = "0xffffffff";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff000000)),
              onTap: () {
                controller.colorSelec1(Colors.black);
                controller.mascotas.color1 = "0xff000000";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff616161)),
              onTap: () {
                controller.colorSelec1(Colors.grey);
                controller.mascotas.color1 = "0xff000000";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xffa1887f)),
              onTap: () {
                controller.colorSelec1(Color(0xffa1887f)); //marron claro
                controller.mascotas.color1 = "0xffa1887f";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff3e2723)),
              onTap: () {
                controller.colorSelec1(Color(0xff3e2723)); //marron oscuro
                controller.mascotas.color1 = "0xff3e2723";
                Get.back();
              },
            ),
          ],
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: _container(Color(0xffef9a9a)),
              onTap: () {
                controller.colorSelec1(Color(0xffef9a9a)); //rojizo
                controller.mascotas.color1 = "0xffef9a9a";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xffffeb3b)),
              onTap: () {
                controller.colorSelec1(Color(0xffffeb3b)); //rubio
                controller.mascotas.color1 = "0xffffeb3b";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xfffb8c00)),
              onTap: () {
                controller.colorSelec1(Color(0xfffb8c00)); //naranja
                controller.mascotas.color1 = "0xfffb8c00";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff33691e)),
              onTap: () {
                controller.colorSelec1(Color(0xff33691e)); //verde musgo
                controller.mascotas.color1 = "0xff33691e";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0x00000000)),
              onTap: () {
                controller.colorSelec1(Color(0x00000000)); //verde musgo
                controller.mascotas.color1 = "0x00000000";
                Get.back();
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _selector2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: _container(Color(0xffffffff)),
              onTap: () {
                controller.colorSelec2(Colors.white);
                controller.mascotas.color2 = "0xffffffff";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff000000)),
              onTap: () {
                controller.colorSelec2(Colors.black);
                controller.mascotas.color2 = "0xff000000";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff616161)),
              onTap: () {
                controller.colorSelec2(Colors.grey);
                controller.mascotas.color2 = "0xff000000";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xffa1887f)),
              onTap: () {
                controller.colorSelec2(Color(0xffa1887f)); //marron claro
                controller.mascotas.color2 = "0xffa1887f";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff3e2723)),
              onTap: () {
                controller.colorSelec2(Color(0xff3e2723)); //marron oscuro
                controller.mascotas.color2 = "0xff3e2723";
                Get.back();
              },
            ),
          ],
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: _container(Color(0xffef9a9a)),
              onTap: () {
                controller.colorSelec2(Color(0xffef9a9a)); //rojizo
                controller.mascotas.color2 = "0xffef9a9a";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xffffeb3b)),
              onTap: () {
                controller.colorSelec2(Color(0xffffeb3b)); //rubio
                controller.mascotas.color2 = "0xffffeb3b";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xfffb8c00)),
              onTap: () {
                controller.colorSelec2(Color(0xfffb8c00)); //naranja
                controller.mascotas.color2 = "0xfffb8c00";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff33691e)),
              onTap: () {
                controller.colorSelec2(Color(0xff33691e)); //verde musgo
                controller.mascotas.color2 = "0xff33691e";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0x00000000)),
              onTap: () {
                controller.colorSelec2(Color(0x00000000)); //verde musgo
                controller.mascotas.color2 = "0x00000000";
                Get.back();
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _selector3() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: _container(Color(0xffffffff)),
              onTap: () {
                controller.colorSelec3(Colors.white);
                controller.mascotas.color3 = "0xffffffff";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff000000)),
              onTap: () {
                controller.colorSelec3(Colors.black);
                controller.mascotas.color3 = "0xff000000";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff616161)),
              onTap: () {
                controller.colorSelec3(Colors.grey);
                controller.mascotas.color3 = "0xff000000";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xffa1887f)),
              onTap: () {
                controller.colorSelec3(Color(0xffa1887f)); //marron claro
                controller.mascotas.color3 = "0xffa1887f";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff3e2723)),
              onTap: () {
                controller.colorSelec3(Color(0xff3e2723)); //marron oscuro
                controller.mascotas.color3 = "0xff3e2723";
                Get.back();
              },
            ),
          ],
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: _container(Color(0xffef9a9a)),
              onTap: () {
                controller.colorSelec3(Color(0xffef9a9a)); //rojizo
                controller.mascotas.color3 = "0xffef9a9a";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xffffeb3b)),
              onTap: () {
                controller.colorSelec3(Color(0xffffeb3b)); //rubio
                controller.mascotas.color3 = "0xffffeb3b";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xfffb8c00)),
              onTap: () {
                controller.colorSelec3(Color(0xfffb8c00)); //naranja
                controller.mascotas.color3 = "0xfffb8c00";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0xff33691e)),
              onTap: () {
                controller.colorSelec3(Color(0xff33691e)); //verde musgo
                controller.mascotas.color3 = "0xff33691e";
                Get.back();
              },
            ),
            GestureDetector(
              child: _container(Color(0x00000000)),
              onTap: () {
                controller.colorSelec3(Color(0x00000000)); //verde musgo
                controller.mascotas.color3 = "0x00000000";
                Get.back();
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _container(Color col) {
    return Container(
      width: w * 0.10,
      height: h * 0.05,
      decoration: BoxDecoration(
          color: col,
          //here i want to add opacity

          border: Border.all(
            color: Colors.black87,
            width: 2,
          ),
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0),
              bottomLeft: const Radius.circular(15.0),
              bottomRight: const Radius.circular(15.0))),
    );
  }

  Widget _perfil() {
    return Container(
        width: w * 0.97,
        height: h * 0.33,
        child: Stack(
            // Stack superpone widgets

            fit: StackFit.loose,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Positioned(
                top: h * 0.03,
                child: GestureDetector(
                    child: Obx(
                      () => Container(
                          width: w * 0.52,
                          height: h * 0.25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(9.0, 9.0),
                                  blurRadius: 12.0)
                            ],
                            border: Border.all(
                                width: h * 0.003, color: Colors.black87),
                            image: DecorationImage(
                              image: controller.extras.value?.imagenP == null
                                  ? controller.mascotas.profile == ""
                                      ? AssetImage("silueta.jpg")
                                      : NetworkImage(
                                          controller.mascotas.profile)
                                  : FileImage(controller.extras.value?.imagenP),
                              fit: BoxFit.cover,
                            ),
                          )
                          /*   child: controller.extras.value?.imagenP == null
                            ? AssetImage("silueta.jpg")
                            : FileImage(controller.extras.value?.imagenP), */
                          ),
                    ),
                    onTap: () {
                      /*  Get.toNamed(AppRoutes.IMAGEN, arguments: sampleImage); */
                    }),
              ),
              Positioned(
                top: h * 0.27,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: h * 0.025,
                      child: new IconButton(
                        icon: Image.asset(
                          'foto.png',
                          color: Colors.white,
                          height: h * 0.025,
                        ),
                        onPressed: () async {
                          getImage();
                          guardado = true;
                        },
                      ),
                    ),
                    Container(
                      width: w * 0.06,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: h * 0.025,
                      child: new IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: h * 0.025,
                        ),
                        onPressed: () async {
                          getImagePhoto();
                          guardado = true;
                        },
                      ),
                    ),
                    Container(
                      width: w * 0.06,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: h * 0.025,
                      child: IconButton(
                        icon: Image.asset(
                          "eliminar.png",
                          height: h * 0.05,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          controller.mascotas.profile = "";
                          controller.imagenesCarga(null);

                          guardado = false;

                          /*    final pickedFile3 = await picker.getImage(
                              source: ImageSource.gallery); */
                        },
                      ),
                    )
                  ],
                ),
              )
            ]));
  }

  Widget _foto() {
    return Container(
      height: h * 0.37,
      width: w * 0.97,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(5.0, 5.0), blurRadius: 10.0)
          ],
          color: Colors.lightBlueAccent,
          border: Border.all(
            color: Colors.black87,
            width: 2,
          ),
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0),
              bottomLeft: const Radius.circular(15.0),
              bottomRight: const Radius.circular(15.0))),
      child: _grid(),
    );
  }

  Widget _grid() {
    return GridView.count(
      padding: EdgeInsets.only(
          left: w * 0.01, right: w * 0.01, top: h * 0.002, bottom: h * 0.002),
      crossAxisCount: 2,
      children: [
        Stack(
            // Stack superpone widgets
            fit: StackFit.expand,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              GestureDetector(
                child: Obx(
                  () => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: controller.extras.value?.imagenP == null
                              ? controller.mascotas.profile == ""
                                  ? Image.asset(
                                      "silueta.jpg",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      controller.mascotas.profile,
                                      fit: BoxFit.cover,
                                    )
                              : Image.file(
                                  controller.extras.value?.imagenP,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      )),
                ),
                onTap: () {
                  getImage();
                  guardado = true;
                },
              ),
              Positioned(
                height: h * 0.12,
                top: h * 0.152,
                left: w * 0.365,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: h * 0.025,
                  child: new IconButton(
                    icon: Image.asset(
                      "eliminar.png",
                      height: h * 0.05,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      controller.mascotas.profile = "";
                      controller.imagenesCarga(null);

                      guardado = false;
                    },
                  ),
                ),
              ),
            ]),
        Stack(
            // Stack superpone widgets
            fit: StackFit.expand,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              GestureDetector(
                child: Obx(
                  () => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: controller.extras1.value?.imagenP == null
                              ? controller.mascotas.imagen001 == ""
                                  ? Image.asset(
                                      "silueta.jpg",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      controller.mascotas.imagen001,
                                      fit: BoxFit.cover,
                                    )
                              : Image.file(
                                  controller.extras1.value?.imagenP,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      )),
                ),
                onTap: () {
                  getImage1();
                  guardado1 = true;
                },
              ),
              Positioned(
                height: h * 0.12,
                top: h * 0.152,
                left: w * 0.365,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: h * 0.025,
                  child: new IconButton(
                    icon: Image.asset(
                      "eliminar.png",
                      height: h * 0.05,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      controller.mascotas.imagen001 = "";
                      controller.imagenesCarga1(null);

                      guardado1 = false;
                    },
                  ),
                ),
              ),
            ]),
        Stack(
            // Stack superpone widgets
            fit: StackFit.expand,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              GestureDetector(
                child: Obx(
                  () => Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: controller.extras2.value?.imagenP == null
                            ? controller.mascotas.imagen002 == ""
                                ? Image.asset(
                                    "silueta.jpg",
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    controller.mascotas.imagen002,
                                    fit: BoxFit.cover,
                                  )
                            : Image.file(
                                controller.extras2.value?.imagenP,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  getImage2();
                  guardado2 = true;
                },
              ),
              Positioned(
                height: h * 0.12,
                top: h * 0.152,
                left: w * 0.365,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: h * 0.025,
                  child: new IconButton(
                    icon: Image.asset(
                      "eliminar.png",
                      height: h * 0.05,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      controller.mascotas.imagen002 = "";
                      controller.imagenesCarga2(null);

                      guardado2 = false;
                    },
                  ),
                ),
              ),
            ]),
        Stack(
            // Stack superpone widgets
            fit: StackFit.expand,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              GestureDetector(
                child: Obx(
                  () => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: controller.extras3.value?.imagenP == null
                              ? controller.mascotas.imagen003 == ""
                                  ? Image.asset(
                                      "silueta.jpg",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      controller.mascotas.imagen003,
                                      fit: BoxFit.cover,
                                    )
                              : Image.file(
                                  controller.extras3.value?.imagenP,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      )),
                ),
                onTap: () {
                  getImage3();
                  guardado3 = true;
                },
              ),
              Positioned(
                height: h * 0.12,
                top: h * 0.152,
                left: w * 0.365,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: h * 0.025,
                  child: new IconButton(
                    icon: Image.asset(
                      "eliminar.png",
                      height: h * 0.05,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      controller.mascotas.imagen003 = "";
                      controller.imagenesCarga3(null);

                      guardado3 = false;
                    },
                  ),
                ),
              ),
            ]),
        Stack(
            // Stack superpone widgets
            fit: StackFit.expand,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              GestureDetector(
                child: Obx(
                  () => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: controller.extras4.value?.imagenP == null
                              ? controller.mascotas.imagen004 == ""
                                  ? Image.asset(
                                      "silueta.jpg",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      controller.mascotas.imagen004,
                                      fit: BoxFit.cover,
                                    )
                              : Image.file(
                                  controller.extras4.value?.imagenP,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      )),
                ),
                onTap: () {
                  getImage4();
                  guardado4 = true;
                },
              ),
              Positioned(
                height: h * 0.12,
                top: h * 0.152,
                left: w * 0.365,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: h * 0.025,
                  child: new IconButton(
                    icon: Image.asset(
                      "eliminar.png",
                      height: h * 0.05,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      controller.mascotas.imagen004 = "";
                      controller.imagenesCarga4(null);

                      guardado4 = false;
                    },
                  ),
                ),
              ),
            ]),
        Stack(
            // Stack superpone widgets
            fit: StackFit.expand,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              GestureDetector(
                child: Obx(
                  () => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: controller.extras5.value?.imagenP == null
                              ? controller.mascotas.imagen005 == ""
                                  ? Image.asset(
                                      "silueta.jpg",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      controller.mascotas.imagen005,
                                      fit: BoxFit.cover,
                                    )
                              : Image.file(
                                  controller.extras5.value?.imagenP,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      )),
                ),
                onTap: () {
                  getImage5();
                  guardado5 = true;
                },
              ),
              Positioned(
                height: h * 0.12,
                top: h * 0.152,
                left: w * 0.365,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: h * 0.025,
                  child: new IconButton(
                    icon: Image.asset(
                      "eliminar.png",
                      height: h * 0.05,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      controller.mascotas.imagen005 = "";
                      controller.imagenesCarga5(null);

                      guardado5 = false;
                    },
                  ),
                ),
              ),
            ]),
        Stack(
            // Stack superpone widgets
            fit: StackFit.expand,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              GestureDetector(
                child: Obx(
                  () => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: controller.extras6.value?.imagenP == null
                              ? controller.mascotas.imagen006 == ""
                                  ? Image.asset(
                                      "silueta.jpg",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      controller.mascotas.imagen006,
                                      fit: BoxFit.cover,
                                    )
                              : Image.file(
                                  controller.extras6.value?.imagenP,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      )),
                ),
                onTap: () {
                  getImage6();
                  guardado6 = true;
                },
              ),
              Positioned(
                height: h * 0.12,
                top: h * 0.152,
                left: w * 0.365,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: h * 0.025,
                  child: new IconButton(
                    icon: Image.asset(
                      "eliminar.png",
                      height: h * 0.05,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      controller.mascotas.imagen006 = "";
                      controller.imagenesCarga6(null);

                      guardado6 = false;
                    },
                  ),
                ),
              ),
            ]),
        Stack(
            // Stack superpone widgets
            fit: StackFit.expand,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              GestureDetector(
                child: Obx(
                  () => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: controller.extras7.value?.imagenP == null
                              ? controller.mascotas.imagen007 == ""
                                  ? Image.asset(
                                      "silueta.jpg",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      controller.mascotas.imagen007,
                                      fit: BoxFit.cover,
                                    )
                              : Image.file(
                                  controller.extras7.value?.imagenP,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      )),
                ),
                onTap: () {
                  getImage7();
                  guardado7 = true;
                },
              ),
              Positioned(
                height: h * 0.12,
                top: h * 0.152,
                left: w * 0.365,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: h * 0.025,
                  child: new IconButton(
                    icon: Image.asset(
                      "eliminar.png",
                      height: h * 0.05,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      controller.mascotas.imagen007 = "";
                      controller.imagenesCarga7(null);

                      guardado7 = false;
                    },
                  ),
                ),
              ),
            ]),
      ],
    );
  }

  Future getImage1() async {
    var tempImage = await picker.getImage(source: ImageSource.gallery);
    sampleImage1 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga1(File(tempImage.path));
  }

  Future getImagePhoto1() async {
    var tempImage = await picker.getImage(source: ImageSource.camera);
    sampleImage1 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga1(File(tempImage.path));
/*     print(controller.mascotas.profile);
    print(File(tempImage.path)); */
  }

  Future getImage2() async {
    var tempImage = await picker.getImage(source: ImageSource.gallery);
    sampleImage2 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga2(File(tempImage.path));
  }

  Future getImagePhoto2() async {
    var tempImage = await picker.getImage(source: ImageSource.camera);
    sampleImage2 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga2(File(tempImage.path));
/*     print(controller.mascotas.profile);
    print(File(tempImage.path)); */
  }

  Future getImage3() async {
    var tempImage = await picker.getImage(source: ImageSource.gallery);
    sampleImage3 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga3(File(tempImage.path));
  }

  Future getImagePhoto3() async {
    var tempImage = await picker.getImage(source: ImageSource.camera);
    sampleImage3 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga3(File(tempImage.path));
/*     print(controller.mascotas.profile);
    print(File(tempImage.path)); */
  }

  Future getImage4() async {
    var tempImage = await picker.getImage(source: ImageSource.gallery);
    sampleImage4 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga4(File(tempImage.path));
  }

  Future getImagePhoto4() async {
    var tempImage = await picker.getImage(source: ImageSource.camera);
    sampleImage4 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga4(File(tempImage.path));
/*     print(controller.mascotas.profile);
    print(File(tempImage.path)); */
  }

  Future getImage5() async {
    var tempImage = await picker.getImage(source: ImageSource.gallery);
    sampleImage5 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga5(File(tempImage.path));
  }

  Future getImagePhoto5() async {
    var tempImage = await picker.getImage(source: ImageSource.camera);
    sampleImage5 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga5(File(tempImage.path));
/*     print(controller.mascotas.profile);
    print(File(tempImage.path)); */
  }

  Future getImage6() async {
    var tempImage = await picker.getImage(source: ImageSource.gallery);
    sampleImage6 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga6(File(tempImage.path));
  }

  Future getImagePhoto6() async {
    var tempImage = await picker.getImage(source: ImageSource.camera);
    sampleImage6 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga6(File(tempImage.path));
/*     print(controller.mascotas.profile);
    print(File(tempImage.path)); */
  }

  Future getImage7() async {
    var tempImage = await picker.getImage(source: ImageSource.gallery);
    sampleImage7 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga7(File(tempImage.path));
  }

  Future getImagePhoto7() async {
    var tempImage = await picker.getImage(source: ImageSource.camera);
    sampleImage7 = File(tempImage.path); //pasa la ubicacion del archivo
    controller.imagenesCarga7(File(tempImage.path));
/*     print(controller.mascotas.profile);
    print(File(tempImage.path)); */
  }

  Widget _botonPublicar() {
    return RaisedButton.icon(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "disquete.png",
              height: h * 0.04,
            )),
        label: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "GUARDAR",
            style: TextStyle(
                color: Colors.white,
                fontSize: h * 0.030,
                fontWeight: FontWeight.bold),
          ),
        ),
        color: Colors.red,
        splashColor: Colors.green,
        onPressed: _submit);
  }

  void _submit() async {
    /*   _buscadoVsEncontrado(); */

    if (!_formKey.currentState.validate()) return;
    Get.snackbar(
      'Cargando',
      'No cerrar',
    );

    _formKey.currentState.save();

    await _subirProfileGallery();

    if (controller.mascotas.id == "") {
      await controller.crearMascota(controller.mascotas);
      Get.snackbar(
        'Finalizado',
        'Datos Guardados',
      );
    } else {
      await controller.modificarMascota((controller.mascotas));
      Get.snackbar(
        'Finalizado',
        'Datos Modificados',
      );
    }
    _blanqueo();
  }

  _blanqueo() {
    controller.blanquear();
    _contNombre.clear();
    _contComent.clear();
    _ubi.clear();
    _telefono.clear();
    _whatsapp.clear();
    _mail.clear();
    controller.edades.value = "Cachorro";
    controller.tamaos.value = "Pequeño";
    controller.catdog.value = "Perro";
    controller.genero.value = "Macho";
    controller.colorSelec1(Color(0x00000000));
    controller.colorSelec2(Color(0x00000000));
    controller.colorSelec3(Color(0x00000000));
    controller.imagenesCarga(null);
    controller.imagenesCarga1(null);
    controller.imagenesCarga2(null);
    controller.imagenesCarga3(null);
    controller.imagenesCarga4(null);
    controller.imagenesCarga5(null);
    controller.imagenesCarga6(null);
    controller.imagenesCarga7(null);
    controller.collarSiNo.value = false;
    controller.combob.value = "Callejero";
    controller.comboGato.value = "Callejero";
    controller.fecha.value = "  /  /    ";
    sampleImage = null;
    sampleImage1 = null;
    sampleImage2 = null;
    sampleImage3 = null;
    sampleImage4 = null;
    sampleImage5 = null;
    sampleImage6 = null;
    sampleImage7 = null;
    guardado = false;
  }
}

/* 
Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
 
                            ]),
                      ),
 */

//==============================================================================

/* 


// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(GalleryLocalizations.of(context).demoTextFieldTitle),
      ),
      body: const TextFormFieldDemo(),
    );
  }
}

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({Key key}) : super(key: key);

  @override
  TextFormFieldDemoState createState() => TextFormFieldDemoState();
}

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText
                ? GalleryLocalizations.of(context)
                    .demoTextFieldShowPasswordLabel
                : GalleryLocalizations.of(context)
                    .demoTextFieldHidePasswordLabel,
          ),
        ),
      ),
    );
  }
}

class TextFormFieldDemoState extends State<TextFormFieldDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PersonData person = PersonData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidateMode =
          AutovalidateMode.always; // Start validating on every change.
      showInSnackBar(
        GalleryLocalizations.of(context).demoTextFieldFormErrors,
      );
    } else {
      form.save();
      showInSnackBar(GalleryLocalizations.of(context)
          .demoTextFieldNameHasPhoneNumber(person.name, person.phoneNumber));
    }
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return GalleryLocalizations.of(context).demoTextFieldNameRequired;
    }
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return GalleryLocalizations.of(context)
          .demoTextFieldOnlyAlphabeticalChars;
    }
    return null;
  }

  String _validatePhoneNumber(String value) {
    final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value)) {
      return GalleryLocalizations.of(context).demoTextFieldEnterUSPhoneNumber;
    }
    return null;
  }

  String _validatePassword(String value) {
    final passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty) {
      return GalleryLocalizations.of(context).demoTextFieldEnterPassword;
    }
    if (passwordField.value != value) {
      return GalleryLocalizations.of(context).demoTextFieldPasswordsDoNotMatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);

    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Scrollbar(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                sizedBoxSpace,
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.person),
                    hintText: GalleryLocalizations.of(context)
                        .demoTextFieldWhatDoPeopleCallYou,
                    labelText:
                        GalleryLocalizations.of(context).demoTextFieldNameField,
                  ),
                  onSaved: (value) {
                    person.name = value;
                  },
                  validator: _validateName,
                ),
                sizedBoxSpace,
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.phone),
                    hintText: GalleryLocalizations.of(context)
                        .demoTextFieldWhereCanWeReachYou,
                    labelText: GalleryLocalizations.of(context)
                        .demoTextFieldPhoneNumber,
                    prefixText: '+1 ',
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    person.phoneNumber = value;
                  },
                  maxLength: 14,
                  maxLengthEnforced: false,
                  validator: _validatePhoneNumber,
                  // TextInputFormatters are applied in sequence.
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    // Fit the validating format.
                    _phoneNumberFormatter,
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.email),
                    hintText: GalleryLocalizations.of(context)
                        .demoTextFieldYourEmailAddress,
                    labelText:
                        GalleryLocalizations.of(context).demoTextFieldEmail,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    person.email = value;
                  },
                ),
                sizedBoxSpace,
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: GalleryLocalizations.of(context)
                        .demoTextFieldTellUsAboutYourself,
                    helperText: GalleryLocalizations.of(context)
                        .demoTextFieldKeepItShort,
                    labelText:
                        GalleryLocalizations.of(context).demoTextFieldLifeStory,
                  ),
                  maxLines: 3,
                ),
                sizedBoxSpace,
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText:
                        GalleryLocalizations.of(context).demoTextFieldSalary,
                    suffixText:
                        GalleryLocalizations.of(context).demoTextFieldUSD,
                  ),
                  maxLines: 1,
                ),
                sizedBoxSpace,
                PasswordField(
                  fieldKey: _passwordFieldKey,
                  helperText:
                      GalleryLocalizations.of(context).demoTextFieldNoMoreThan,
                  labelText:
                      GalleryLocalizations.of(context).demoTextFieldPassword,
                  onFieldSubmitted: (value) {
                    setState(() {
                      person.password = value;
                    });
                  },
                ),
                sizedBoxSpace,
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: GalleryLocalizations.of(context)
                        .demoTextFieldRetypePassword,
                  ),
                  maxLength: 8,
                  obscureText: true,
                  validator: _validatePassword,
                ),
                sizedBoxSpace,
                Center(
                  child: RaisedButton(
                    child: Text(
                        GalleryLocalizations.of(context).demoTextFieldSubmit),
                    onPressed: _handleSubmitted,
                  ),
                ),
                sizedBoxSpace,
                Text(
                  GalleryLocalizations.of(context).demoTextFieldRequiredField,
                  style: Theme.of(context).textTheme.caption,
                ),
                sizedBoxSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
} */
