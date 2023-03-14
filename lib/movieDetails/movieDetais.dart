import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../routeHelper/Route.dart';
import 'controller/movieDetailsController.dart';

class MovieDetails extends StatelessWidget {
  MovieDetailsController controller=Get.put(MovieDetailsController());
  @override
  Widget build(BuildContext context) {



    return Obx(() => controller.isLoading.value?
    Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            Stack(
              children: [
                Container(
                    height: Get.height,
                    width: Get.width,
                    color: const Color(0xff201F1B)
                ),

                SizedBox(
                  height: Get.height * .6,
                  width: Get.width,
                  child: Hero(
                      tag: 'movie-hero-${controller.movieDetailsId}',
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://image.tmdb.org/t/p/original/${controller.movieDetails[0].backdropPath}")
                            )
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Color(0xff201F1B),
                                  Color(0xff201F1B).withOpacity(.8),
                                  Color(0xff201F1B).withOpacity(.1),
                                ]
                            ),
                          ),
                        ),
                      )
                  ),
                ),

                Positioned(
                  top: 250,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: Get.width,
                        child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10.0,
                                  sigmaY: 10.0,
                                ),
                                child: Container(
                                  width: 70,
                                 height: 70,
                                    color: Colors.white.withOpacity(0.3),
                                    child: IconButton(onPressed:()=>Get.toNamed(RouteHelper.trailerMovieScreen,arguments: {"id":controller.traillerMovie[0].key}) ,icon:const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 45))
                                ),
                              ),
                            )
                        ),
                      ),
                      const SizedBox(height: 20.0),
                       Text(
                       "${controller.movieDetails[0].title}",style:const TextStyle( color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                    top: 30,
                    child: IconButton(
                        onPressed: () {
                        Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white )
                    )
                ),
                Positioned(
                    top: 415,
                    right: 80,
                    left: 80,
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),color: Colors.green),
                        child: Text("Continue To Watch",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                    )
                ),

                Positioned(
                  top: 500,
                  child: SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "the Credit",
                                style: const TextStyle(color:Colors.white,fontSize: 18),
                              ),
                              TextButton(
                                  onPressed: () {

                                  },
                                  child: const Text(
                                    'See all',
                                    style: TextStyle(color:Colors.white),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.20,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.credit.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.movieDetails, arguments: {
                                          'id': controller.credit[index].id,
                                        });
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.only(right: 15),
                                          width: Get.width * 0.35,
                                          height: Get.height * 0.20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child:ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network(
                                                "https://image.tmdb.org/t/p/original/${controller.credit[index].profilePath}",
                                                fit: BoxFit.fill,
                                              ))),
                                    ),


                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    )
        :const Center(child: CircularProgressIndicator(),));
  }
}