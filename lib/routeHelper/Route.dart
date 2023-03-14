import 'package:get/get_navigation/src/routes/get_route.dart';
import '../home/binding/homeBinding.dart';
import '../home/home.dart';
import '../mainHome/mainHome.dart';
import '../movieDetails/binding/movieDetailsBinding.dart';

import '../movieDetails/movieDetais.dart';
import '../movieDetails/trailerMovie/binding/trailerMovie.dart';
import '../movieDetails/trailerMovie/trailerMovieScreen.dart';

class RouteHelper{
  static const String homeScreen = "/homeScreen";
  static const String mainScreen = "/mainScreen";
  static const String movieDetails = "/movieDetails";
  static const String trailerMovieScreen = "/trailerMovieScreen";


  static List<GetPage> routes = [
    GetPage(name: homeScreen, page: ()=> HomeScreen(),bindings: [HomeBinding()]),
    GetPage(name: mainScreen, page: ()=>const MainHomeScreen()),
    GetPage(name: movieDetails, page: ()=> MovieDetails(),bindings: [MovieDetailsBinding()]),
    GetPage(name: trailerMovieScreen, page: ()=> TrailerMovieScreen(),bindings: [TrailerMovieBinding()]),
  ];
}