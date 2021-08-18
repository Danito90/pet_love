import 'package:dio/dio.dart';
import 'package:get/get.dart' as getr;
import 'package:pet_love/data/model/mascotas_model.dart';

class MascotasProvider {
  final String _url =
      'https://petvet-923d3-default-rtdb.firebaseio.com/'; //url de la base de datos

  final Dio _dio = getr.Get.find<Dio>(); //para interactuar con el ApiRest

  Future<List<Mascotas>> getMascotas() async {
    //recibiendo .json
    final url = '$_url/Mascotas.json'; //nos trae los .json

    final Response response = await _dio.get(
      //await es esperar a que se termien de ejecutar el codigo
      //_dio.get trae los datos de la url
      url,
    );

    if (response.statusCode == 200) {
      //en caso de estar ok la transferencia de datos
      Map data = response.data; //los pasa a un map

      if (data == null) return []; //verifica que no este nulo
      final List<Mascotas> listaPet = List(); //crea la lista

      data.forEach((id, pet) {
        final petTemp = Mascotas.fromJson(
            pet); //va convirtiendo cada grupo de dato en el .json
        petTemp.id = id;
        /* seteamos el id..da un id a cada grupo de datos (objeto)(que esta en otro nivel y es el que contiene los datos,
        lo vemos como el conjunto de letras y numeros largo) */

        listaPet.add(petTemp); // y agrega a la lista
      });

      return listaPet; //nos retorna y muestra todos los datos
    } else {
      throw Exception();
    }
  }

  Future<List<Mascotas>> getFiltroMascotas(String nombre1) async {
    var param1 = '"' + nombre1 + '"';
    var param2 = '"' + nombre1 + '\uf8ff' + '"';
    final url1 =
        '$_url/Mascotas.json?orderBy="nombre"&startAt=$param1&endAt=$param2';

    final Response response = await _dio.get(
      url1,
    );
    //response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});

    if (response.statusCode == 200) {
      Map data = response.data;

      if (data == null) return [];
      final List<Mascotas> listaPet = List();

      data.forEach((id, pet) {
        final petTemp = Mascotas.fromJson(pet);
        petTemp.id = id;
        listaPet.add(petTemp);
      });

      return listaPet;
    } else {
      throw Exception();
    }
  }

  Future<bool> crearMascotas(Mascotas mascotas) async {
    final url = '$_url/Mascotas.json';

    //final resp = await http.post(url, body: turnoToJson(turno));
    final resp = await _dio.post(url, data: mascotasToJson(mascotas));

    //.post(url, data: {"nombre": trabajo.nombre, "valor": trabajo.valor});

    Map data = resp.data;

    return true;
  }

  Future<bool> modificarMascotas(Mascotas mascotas) async {
    final url = '$_url/Mascotas/${mascotas.id}.json';

    final resp = await _dio.put(url, data: mascotasToJson(mascotas));
    //print(resp.statusCode);

    Map data = resp.data;

    return true;
  }

  Future<bool> eliminarMascotas(Mascotas mascotas) async {
    final url = '$_url/Mascotas/${mascotas.id}.json';

    final resp = await _dio.delete(url, data: mascotasToJson(mascotas));
    //print(resp.statusCode);

    Map data = resp.data;

    return true;
  }
}
