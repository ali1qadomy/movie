import 'package:get/get.dart' hide Response;

import '../../webServices/dio.dart';
import '../model/CreditModel.dart';
import '../model/MovieDetailsModel.dart';
import 'package:dio/dio.dart';

import '../model/TraillerMovie.dart';
class MovieDetailsController extends GetxController
{

  RxInt movieDetailsId=0.obs;
  RxList<MovieDetails> movieDetails=<MovieDetails>[].obs;
  RxList<CreditModel> credit=<CreditModel>[].obs;
  RxList<MovieTrailler> traillerMovie=<MovieTrailler>[].obs;
  RxBool isLoading=false.obs;

  getMovieDetail(id) async {
    Response response = await DioHelper.getData(
        url: "movie/$id?api_key=ca8ac3d57809b198a8643ae796dd5476");
    if (response.statusMessage == "OK") {
      movieDetails.add(MovieDetails.fromJson(response.data));
    } else {
      print("no");
    }
    isLoading.value=true;
  }
  getTrailler(id) async {
    Response response = await DioHelper.getData(
        url: "movie/$id/videos?api_key=ca8ac3d57809b198a8643ae796dd5476");
    if (response.statusMessage == "OK") {
      for(var item in response.data['results']) {
        traillerMovie.add(MovieTrailler.fromJson(item));
      }
    } else {
      print("no");
    }
  }
  getCredit( id) async {
    Response response = await DioHelper.getData(
        url: "movie/$id/credits?api_key=ca8ac3d57809b198a8643ae796dd5476");
    if (response.statusMessage == "OK") {
      for(var item in response.data['cast']) {
        credit.add(CreditModel.fromJson(item));
      }
    } else {
      print("no");
    }
  }

  @override
  void onInit() {
    movieDetailsId.value=Get.arguments['id'];
    getMovieDetail(movieDetailsId);
    getCredit(movieDetailsId);
    getTrailler(movieDetailsId);
  }
}