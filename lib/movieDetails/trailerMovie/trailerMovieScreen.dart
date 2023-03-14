import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controller/movieDetailsController.dart';
import 'controller/trailerMovieController.dart';

class TrailerMovieScreen extends GetWidget<TrailerMovieController> {
  const TrailerMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player:
          YoutubePlayer(
            onReady: () => controller.youtubePlayerController.play(),
              controller: controller.playVideo(controller.videoId)),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              player,
            ],
          ),
        );
      },
    );
  }
}
