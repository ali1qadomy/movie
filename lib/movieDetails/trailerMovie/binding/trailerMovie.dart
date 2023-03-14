import 'package:get/get.dart';

import '../controller/trailerMovieController.dart';

class TrailerMovieBinding implements Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => TrailerMovieController());
  }
}