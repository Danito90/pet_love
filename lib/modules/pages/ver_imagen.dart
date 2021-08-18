import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_love/global_widgets/pet_controller.dart';

class ImagenPage extends GetView<PetController> {
  double h = Get.height;
  double w = Get.width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Container(
            width: w,
            height: h,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black87),
              image: DecorationImage(
                image: NetworkImage("${Get.arguments}"),
                fit: BoxFit.cover,
              ),
            )),
      ),
      onTap: () {
        Get.back();
      },
    );
  }
}
