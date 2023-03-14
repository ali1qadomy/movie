
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movieb/home/widget/customListViewMovie.dart';
import '../routeHelper/Route.dart';
import 'controller/homeController.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  HomeScreen({Key? key}) : super(key: key);
  List category = ['Movies', 'TvShows', 'Anime', 'MyList'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 70,
                          height: 70,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Image.asset("asstes/image/profile.jpg"))),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hello",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "Ali qaodmy",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.pink),
                    width: 40,
                    height: 40,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: Get.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return Obx(
                          ()=> GestureDetector(
                          onTap: () {
                            homeController.indexListCategory.value=index;
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              child: Text(
                                "${category[index]}",
                                style: homeController.indexListCategory== index?const TextStyle(
                                    color:Colors.white, fontSize: 20): const TextStyle(
                                    color:Color(0xff4B4A46), fontSize: 20),
                              )),
                        ),
                      );
                    },
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    ()=> SizedBox(
                      height: Get.height * 0.35,
                      child: PageView.builder(
                        onPageChanged: (value) =>
                            homeController.PageNumber.value = value,
                        controller: homeController.pageViewControlelr,
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.upComing.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                width: 400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        child: Image.network(
                                          "https://image.tmdb.org/t/p/original/${homeController.upComing[index].backdropPath}",
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "${homeController.upComing[index].title}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 105,
                                left: 85,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.play_arrow_outlined,
                                        color: Colors.white,
                                        size: 27,
                                      )),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal:150),
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor:
                                      homeController.PageNumber == index
                                          ? Colors.white
                                          : Colors.grey,
                                ))),
                      ),
                    ),
                  ),
                ],
              ),
              CustomListViewMovie(
                  controller: homeController.nowPlaying,
                  labelName: "Recent Watched",
                  seeAll: RouteHelper.mainScreen,
              scroll: homeController.nowPlayingScroll,),
              CustomListViewMovie(
                  controller: homeController.topRated,
                  labelName: "Top Rated",
                  seeAll: RouteHelper.mainScreen,
              // scroll: homeController.topRatedScroll
                ),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
