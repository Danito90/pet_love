import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pet_love/data/provider/mascotas_provider.dart';
import 'package:pet_love/data/repository/pet_repository.dart';
import 'package:pet_love/global_widgets/pet_controller.dart';

class PetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => MascotasProvider());

    Get.lazyPut(() => MascotasRepository());

    Get.lazyPut<PetController>(() => PetController(petRepository: Get.find()));
  }
}
