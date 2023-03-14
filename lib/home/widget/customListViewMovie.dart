import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieb/home/controller/homeController.dart';
import '../../routeHelper/Route.dart';
import '../model/moviemodel.dart';

class CustomListViewMovie extends StatelessWidget {
  HomeController homeController=Get.put(HomeController());
  late int index;
  List controller;
  late String labelName;
  VoidCallback? movieDeatilWithId;
  late String seeAll;
   ScrollController? scroll;


  CustomListViewMovie(
      {super.key,
      required this.controller,
      required this.labelName,
      required this.seeAll,
       this.scroll});
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  labelName,
                  style: const TextStyle(color:Colors.white,fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(seeAll, arguments: {
                        'page': labelName,
                        'controller': controller,
                      });
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
                controller: scroll,
                scrollDirection: Axis.horizontal,
                itemCount: controller.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.movieDetails, arguments: {
                            'id': controller[index].id!,
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
                                        child:
                                        CachedNetworkImage
                                        (
                                              imageUrl: "https://image.tmdb.org/t/p/original/${controller[index].backdropPath}",
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
    );
  }
}
