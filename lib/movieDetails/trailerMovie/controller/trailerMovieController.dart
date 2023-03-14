import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerMovieController extends GetxController
{
  RxString videoId="".obs;
late YoutubePlayerController youtubePlayerController;
playVideo(videoId){
  youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId.toString(),
      flags:const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        hideThumbnail: true,
        forceHD: false,
      ))..toggleFullScreenMode();
  return youtubePlayerController;
}
  @override
  void onInit() {
  print(Get.arguments['id']);
    videoId.value=Get.arguments['id'];
    super.onInit();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }
}