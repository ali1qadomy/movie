import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movieb/mainHome/widget/tabs.dart';

import '../favorite/favoriteScreen.dart';
import '../home/home.dart';
import '../profile/profileScreen.dart';
import '../searchScreen/searchScreen.dart';
import '../videos/video.dart';
import 'controller/mainHomeController.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainHomeScreenState();
  }
}

class MainHomeScreenState extends State<MainHomeScreen> {
  MainHomeController controller = Get.put(MainHomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

        body:Stack(children: [

        controller.currentPage == 0
        ? HomeScreen()
        : controller.currentPage == 1
    ? VideoScreen()
        : controller.currentPage == 2
    ? SearchScreen()
        : controller.currentPage == 3
    ? FavoriteScreen()
        : ProfileScreen(),
          _buildBottomTab(),
        ],));
  }

  _buildBottomTab() {
    return Stack(
      children: [
        Positioned(
          left: 5,
          right: 5,
          bottom: 10,
          child: Container(
            decoration: const BoxDecoration(color:Color(0xff3C3932) ,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topLeft:Radius.circular(8) ,topRight:Radius.circular(8) ,bottomRight: Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TabItem(
                  icon: controller.currentPage.value == 0
                      ? Icons.home_outlined
                      : Icons.home_outlined,
                  isSelected: controller.currentPage.value == 0,
                  onTap: () {
                    setState(() {
                      controller.currentPage.value = 0;
                    });
                  },
                ),
                TabItem(
                  icon: controller.currentPage.value == 1
                      ? Icons.live_tv
                      : Icons.live_tv,
                  isSelected: controller.currentPage.value == 1,
                  onTap: () {
                    setState(() {
                      controller.currentPage.value = 1;
                    });
                  },
                ),
                TabItem(
                  icon: controller.currentPage.value == 2
                      ? Icons.search
                      : Icons.search,
                  isSelected: controller.currentPage.value == 2,
                  onTap: () {
                    setState(() {
                      controller.currentPage.value = 2;
                    });
                  },
                ),
                TabItem(
                  icon: controller.currentPage.value == 3
                      ? Icons.favorite
                      : Icons.favorite,
                  isSelected: controller.currentPage.value == 3,
                  onTap: () {
                    setState(() {
                      controller.currentPage.value = 3;
                    });
                  },
                ),
                TabItem(
                  icon:
                  controller.currentPage.value == 4 ? Icons.person : Icons.person,
                  isSelected: controller.currentPage.value == 4,
                  onTap: () {
                    setState(() {
                      controller.currentPage.value = 4;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
