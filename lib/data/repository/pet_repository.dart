import 'package:get/get.dart';
import 'package:pet_love/data/model/mascotas_model.dart';
import 'package:pet_love/data/provider/mascotas_provider.dart';

class MascotasRepository {
  final MascotasProvider _mascotasDataSource = Get.find<MascotasProvider>();

  @override
  Future<List<Mascotas>> getMascotas() async {
    return _mascotasDataSource
        .getMascotas(); //nos devuelve a trabes de getTrabajo, los datos
  }

  Future<List<Mascotas>> getFiltroMascotas(String nombre) async {
    return _mascotasDataSource.getFiltroMascotas(nombre);
  }

  Future<bool> crearMascotas(Mascotas mascotas) async {
    return _mascotasDataSource.crearMascotas(mascotas);
  }

  Future<bool> modificarMascotas(Mascotas mascotas) async {
    return _mascotasDataSource.modificarMascotas(mascotas);
  }

  Future<bool> eliminarMascotas(Mascotas mascotas) async {
    return _mascotasDataSource.eliminarMascotas(mascotas);
  }
}
