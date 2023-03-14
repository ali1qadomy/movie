import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

import '../../webServices/dio.dart';
import '../model/MovieModel.dart';

class HomeController extends GetxController {
  RxList<MovieModel> nowPlaying = <MovieModel>[].obs;
  RxList<MovieModel> topRated = <MovieModel>[].obs;
  RxList<MovieModel> upComing = <MovieModel>[].obs;
  RxInt PaginationHome=1.obs;
  RxBool isLoading = false.obs;
  RxInt topRatedPageCount = 1.obs;
  RxInt PageNumber=0.obs;
  RxInt nowPlayingPageCount = 1.obs;
  RxInt indexListCategory=0.obs;
  PageController? pageViewControlelr = PageController(viewportFraction: 0.6);
   ScrollController nowPlayingScroll=ScrollController();
   ScrollController topRatedScroll=ScrollController();

//method to fetch all data from movie type now playing
  getnowPlaying() async {
    Response response = await DioHelper.getData(
        url: "movie/now_playing?api_key=ca8ac3d57809b198a8643ae796dd5476&page=$nowPlayingPageCount");
    if (response.statusMessage == "OK") {
      List<MovieModel> item=<MovieModel>[];
      for (int i=0; i<=14 ;i++) {
        // to entry object from api to store in list
        item.add(MovieModel.fromJson(response.data['results'][i]));
      }
      nowPlaying.addAll(item);
    } else {
      print("no");
    }
  }

//method to fetch all data from movie type popular
  getTopRated() async {
    Response response = await DioHelper.getData(
        url: "movie/top_rated?api_key=ca8ac3d57809b198a8643ae796dd5476&page=$topRatedPageCount");
    if (response.statusMessage == "OK") {
      List<MovieModel> item=<MovieModel>[];
      for (int i=0; i<=14 ;i++) {
        // to entry object from api to store in list
         item.add(MovieModel.fromJson(response.data['results'][i]));
      }
      topRated.addAll(item);
    } else {
      print("no");
    }

  }

  // this data view in home screen page view
  getUpComing() async {
    Response response = await DioHelper.getData(
        url: "movie/upcoming?api_key=ca8ac3d57809b198a8643ae796dd5476");
    if (response.statusMessage == "OK") {
      for (int i=0; i<3 ;i++) {
        // to entry object from api to store in list
        upComing.add(MovieModel.fromJson(response.data['results'][i]));
      }
    } else {
      print("no");
    }
    isLoading.value = true;
  }

  @override
  void onInit() {
    getUpComing();
    // invoke method to run when home controller init
    getnowPlaying();
    getTopRated();
    topRatedScroll=ScrollController();
    nowPlayingScroll=ScrollController();
    topRatedScroll.addListener(scrollControllerTopRated);
    nowPlayingScroll.addListener(scrollControllernowPlaying);
    super.onInit();
  }

  scrollControllernowPlaying(){

    if(nowPlayingScroll.hasClients)
      {
        // if(nowPlayingScroll.position.pixels==nowPlayingScroll.position.maxScrollExtent)
        // {
          nowPlayingPageCount.value+=1;
          getnowPlaying();
        // }
      }
  }
  scrollControllerTopRated()  {
    // if (topRatedScroll.position.pixels==topRatedScroll.position.maxScrollExtent) {
        topRatedPageCount.value += 1;
         getTopRated();
    // }

  }
}
