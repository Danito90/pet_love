import 'package:flutter/material.dart';
import 'package:pet_love/global_widgets/boton_escondido.dart';

class Eleccion extends StatelessWidget {
  const Eleccion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BotonEscondido(),
    );
  }

/*   Widget _titulo(String text) {
    return Text(
      "$text:",
      style: TextStyle(
        fontSize: 25,
      ),
    );
  } */

}
