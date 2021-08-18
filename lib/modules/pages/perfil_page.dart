import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_love/global_widgets/loading_widget.dart';
import 'package:pet_love/global_widgets/pet_controller.dart';
import 'package:pet_love/modules/local_widgets/drawer.dart';
import 'package:pet_love/routes/app_routes.dart';

class PerfilPage extends GetView<PetController> {
  List<String> imagenes = [];
  final _formKey = GlobalKey<FormState>();

  double h = Get.height;
  double w = Get.width;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.status.value ==
            Status.loading // si esta cargando :
        ? LoadingWidget() //mientras muestra la carga
        : SingleChildScrollView(
            child: Container(
              width: w,
              height: h,
              color: Colors.blue[300],
              /*         decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("fondo.jpg"), fit: BoxFit.cover)), */
              child: Scaffold(
                drawer: DrawerPet(),
                appBar: AppBar(
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(40)), //solo circular abajo
                  ),
                  toolbarHeight: 100,
                  backgroundColor: Colors.blue,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back, size: h * 0.05),
                      tooltip: "Regresar",
                      onPressed: () {
                        Get.arguments == "Agregar buscado" ||
                                Get.arguments == "Agregar encontrado"
                            ? Get.toNamed(AppRoutes.HOME)
                            : controller.mascotas.buscado == true
                                ? Get.toNamed(AppRoutes.BUSCADOS)
                                : Get.toNamed(AppRoutes.ENCONTRADOS);
                      },
                    ),
                    Container(
                      width: w * 0.02,
                    )
                  ],
                  title: Center(
                    child: Text(
                      "${controller.mascotas.nombre}".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                body: Container(
                  width: w,
                  height: h,
                  child: Form(
                    key: _formKey,
                    child: new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: w * 0.97,
                              height: h * 0.35,
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                      fit: StackFit.loose,
                                      alignment: AlignmentDirectional.topCenter,
                                      children: <Widget>[
                                        _imagenMascota(),
                                      ]),
                                ],
                              ),
                            ),

                            /* Divider(
                        height: 25,
                        color: Colors.white.withOpacity(0.40),
                        thickness: 2,
                      ), */

                            Container(
                              width: w * 0.97,
                              height: h * 0.52,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueAccent.withOpacity(0.9),
                                      offset: Offset(0, 5.0),
                                      blurRadius: 12.0)
                                ],
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 25.0),
                                  child: _cajaDecorada(
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _atributo("Raza:", 0.03),
                                                  _info(
                                                      controller.mascotas.raza),
                                                ],
                                              ),
                                              Container(
                                                width: w * 0.1,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _atributo("Género:", 0.03),
                                                  _info(controller
                                                      .mascotas.genero),
                                                ],
                                              ),
                                            ]),
                                        Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _atributo("Tamaño:", 0.03),
                                                  _info(controller
                                                      .mascotas.tamao),
                                                ],
                                              ),
                                              Container(
                                                width: w * 0.15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _atributo("Edad:", 0.03),
                                                  _info(
                                                      controller.mascotas.edad),
                                                ],
                                              ),
                                            ]),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _atributo("Colores:", 0.03),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                _colores(
                                                    controller.mascotas.color1),
                                                _colores(
                                                    controller.mascotas.color2),
                                                _colores(
                                                    controller.mascotas.color3),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  controller.mascotas.buscado ==
                                                          true
                                                      ? _atributo(
                                                          "Fecha  de Extravío:",
                                                          0.03)
                                                      : _atributo(
                                                          "Fecha de Encuentro:",
                                                          0.03),
                                                  _info(controller
                                                      .mascotas.fecha),
                                                ],
                                              ),
                                              Container(
                                                width: w * 0.01,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _atributo(
                                                      "¿Lleva collar?:", 0.03),
                                                  _info(
                                                    controller.mascotas
                                                                .collar ==
                                                            true
                                                        ? "Si".toUpperCase()
                                                        : "No".toUpperCase(),
                                                  )
                                                ],
                                              ),
                                            ]),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _atributo("Ubicacíon:", 0.03),
                                            Wrap(
                                                // Wrap crea un segundo renglon automaticamente
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                alignment: WrapAlignment.start,
                                                children: <Widget>[
                                                  _info(controller
                                                      .mascotas.direccion),
                                                ]),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            BottomSection()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
  }

  Widget _imagenMascota() {
    return GestureDetector(
      child: Container(
          width: w * 0.58,
          height: h * 0.35,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(7.0, 15.0),
                  blurRadius: 15.0)
            ],
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.black87),
            image: DecorationImage(
              image: controller.mascotas.profile == null ||
                      controller.mascotas.profile == ""
                  ? AssetImage("silueta.jpg")
                  : NetworkImage("${controller.mascotas.profile}"),
              fit: BoxFit.cover,
            ),
          )),
      onTap: () {
        Get.toNamed(AppRoutes.IMAGEN, arguments: controller.mascotas.profile);
      },
    );
  }

  Widget _atributo(String titulo, double top) {
    return Padding(
      padding: EdgeInsets.only(left: h * 0.04, right: h * 0.03, top: h * top),
      child: Text(titulo,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
    );
  }

  Widget _info(var dato) {
    return Padding(
        padding:
            EdgeInsets.only(left: h * 0.04, right: h * 0.03, top: h * 0.008),
        child: Text(dato.toUpperCase(), //.toUpperCase() cconvierte  mayuscula
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black)));
  }

  Widget _colores(String color) {
    return Padding(
      padding: EdgeInsets.only(left: h * 0.04, right: h * 0.03, top: h * 0.008),
      child: Container(
        width: w * 0.10,
        height: h * 0.05,
        decoration: BoxDecoration(
            color: Color(int.parse(color)), //here i want to add opacity

            border: Border.all(
              color: Colors.black87,
              width: 2,
            ),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
                bottomLeft: const Radius.circular(15.0),
                bottomRight: const Radius.circular(15.0))),
      ),
    );
  }

  Widget _cajaDecorada(Widget _widget) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.70), //here i want to add opacity

            border: Border.all(
              color: Colors.black87,
              width: 2,
            ),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(80.0),
                topRight: const Radius.circular(00.0),
                bottomLeft: const Radius.circular(0.0),
                bottomRight: const Radius.circular(80.0))),
        child: _widget);
  }
}

//=======================
// Build bottom Profile
//=======================
class BottomSection extends StatefulWidget {
  @override
  _BottomSectionState createState() => new _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection>
    with TickerProviderStateMixin {
  final PetController c = Get.put(PetController());
  double h = Get.height;
  double w = Get.width;
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: 'Fotos'),
      Tab(text: 'Contacto'),
      Tab(text: 'Comentarios'),
    ];
    _pages = [
      Gallery(),
      Skills(),
      About(),
    ];
    _controller = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: new Column(
          children: <Widget>[
            Container(
              width: w * 0.98,
              decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.80), //here i want to add opacity

                  border: Border.all(
                    color: Colors.black87,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(80.0),
                      topRight: const Radius.circular(80.0),
                      bottomLeft: const Radius.circular(6.0),
                      bottomRight: const Radius.circular(6.0))),
              child: Column(
                children: [
                  TabBar(
                    controller: _controller,
                    tabs: _tabs,
                    labelColor: Theme.of(context).accentColor,
                    indicatorColor: Theme.of(context).accentColor,
                  ),
                ],
              ),
            ),
            Container(
              height: h * 0.005,
            ),
            new Container(
              height: h * 0.4,
              width: w * 0.98,
              decoration: BoxDecoration(
                  color: Colors.grey
                      .withOpacity(0.70), //here i want to add opacity

                  border: Border.all(
                    color: Colors.black87,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                      bottomLeft: const Radius.circular(15.0),
                      bottomRight: const Radius.circular(15.0))),
              child: new TabBarView(
                controller: _controller,
                children: _pages,
              ),
            ),
            Container(
              height: h * 0.005,
            )
          ],
        ),
      ),
    );
  }
}

//==============================================================================

//===================
// Build Gallery Tab
//===================
class Gallery extends GetView<PetController> {
  double h = Get.height;
  double w = Get.width;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: w,
          child: Wrap(
            verticalDirection: VerticalDirection.down,
            alignment: WrapAlignment.start,
            children: [
              _foto(controller.mascotas.profile, controller.mascotas.imagen001),
              _foto(
                  controller.mascotas.imagen002, controller.mascotas.imagen003),
              _foto(
                  controller.mascotas.imagen004, controller.mascotas.imagen005),
              _foto(
                  controller.mascotas.imagen006, controller.mascotas.imagen007),
            ],
          )),
    );
  }

  Widget _foto(var ft, var ft2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: Container(
              child: ft == null || ft.isEmpty
                  ? Card(
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
                            child: Image.asset(
                              "silueta.jpg",
                              height: h * 0.25,
                              width: w * 0.464,
                              fit: BoxFit.fill,
                            )),
                      ))
                  : Card(
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
                          child: Image.network(
                            ft,
                            height: h * 0.25,
                            width: w * 0.464,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ))),
          onTap: () {
            if (ft == null || ft.isEmpty) {
            } else {
              Get.toNamed(AppRoutes.IMAGEN, arguments: ft);
            }
          },
        ),
        GestureDetector(
          child: Container(
              child: ft2 == null || ft2.isEmpty
                  ? Card(
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
                            child: Image.asset(
                              "silueta.jpg",
                              height: h * 0.25,
                              width: w * 0.464,
                              fit: BoxFit.fill,
                            )),
                      ))
                  : Card(
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
                          child: Image.network(
                            ft2,
                            height: h * 0.25,
                            width: w * 0.464,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ))),
          onTap: () {
            if (ft2 == null || ft2.isEmpty) {
            } else {
              Get.toNamed(AppRoutes.IMAGEN, arguments: ft2);
            }
          },
        ),
      ],
    );
  }
}

//==============================================================================

//===================
// Build Skills Tab
//===================
class Skills extends GetView<PetController> {
  double h = Get.height;
  double w = Get.width;
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Obx(
        () => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _atributo2("Telefono:", 0.04),
                        _info3(controller.mascotas.telefono),
                      ],
                    ),
                    Container(
                      width: w * 0.08,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _atributo2("WhatsApp:", 0.04),
                        _info3(controller.mascotas.whatsapp),
                      ],
                    ),
                  ]),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _atributo2("Mail:", 0.04),
                      Padding(
                          padding: EdgeInsets.only(
                              left: h * 0.04, right: h * 0.03, top: h * 0.008),
                          child: Text(
                              '${controller.mascotas.mail}', //.toUpperCase() cconvierte  mayuscula
                              style: TextStyle(
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _atributo2(String titulo, double top) {
    return Padding(
      padding: EdgeInsets.only(left: h * 0.04, right: h * 0.03, top: h * top),
      child: Text(titulo,
          style: TextStyle(fontSize: h * 0.025, fontWeight: FontWeight.bold)),
    );
  }

  Widget _info3(var dato) {
    return Padding(
        padding:
            EdgeInsets.only(left: h * 0.04, right: h * 0.03, top: h * 0.008),
        child: Text(dato.toUpperCase(), //.toUpperCase() cconvierte  mayuscula
            style: TextStyle(
                fontSize: h * 0.025,
                fontWeight: FontWeight.bold,
                color: Colors.black)));
  }
}

//==============================================================================

//===================
// Build About Tab
//===================
class About extends GetView<PetController> {
  double h = Get.height;
  double w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            height: h * 0.01,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h * 0.37,
                width: w * 0.88,
                child: Wrap(
                    // Wrap crea un segundo renglon automaticamente
                    verticalDirection: VerticalDirection.down,
                    alignment: WrapAlignment.start,
                    children: <Widget>[
                      controller.mascotas.comentarios == null ||
                              controller.mascotas.comentarios.isEmpty
                          ? _info2("Sin Comentarios")
                          : _info2(controller.mascotas.comentarios),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _info2(var dato) {
    return Padding(
        padding:
            EdgeInsets.only(left: h * 0.04, right: h * 0.03, top: h * 0.008),
        child: Text(dato,
            style: TextStyle(
                fontSize: h * 0.034,
                fontWeight: FontWeight.bold,
                color: Colors.black)));
  }
}
