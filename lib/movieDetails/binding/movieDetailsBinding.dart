
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../controller/movieDetailsController.dart';

class MovieDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailsController());
  }
}
