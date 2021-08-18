import 'package:get/route_manager.dart';

import 'package:pet_love/modules/pages/buscados.dart';
import 'package:pet_love/modules/pages/encontrados.dart';
import 'package:pet_love/modules/pages/home.dart';
import 'package:pet_love/global_widgets/pet_binding.dart';
import 'package:pet_love/modules/pages/modificar.dart';
import 'package:pet_love/modules/pages/perfil_page.dart';

import 'package:pet_love/modules/pages/ver_imagen.dart';

import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => Home(),
      binding: PetBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => Home(),
      binding: PetBinding(),
    ),
    GetPage(
      name: AppRoutes.BUSCADOS,
      page: () => BuscadosPage(),
      binding: PetBinding(),
    ),
    GetPage(
      name: AppRoutes.ENCONTRADOS,
      page: () => EncontradosPage(),
      binding: PetBinding(),
    ),
    GetPage(
      name: AppRoutes.AGREGAR,
      page: () => AgregarPage(),
      binding: PetBinding(),
    ),
    GetPage(
      name: AppRoutes.PERFIL,
      page: () => PerfilPage(),
      binding: PetBinding(),
    ),
    GetPage(
      name: AppRoutes.IMAGEN,
      page: () => ImagenPage(),
      binding: PetBinding(),
    ),
  ];
}
