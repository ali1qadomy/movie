
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieb/routeHelper/Route.dart';
import 'package:movieb/webServices/dio.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'mainHome/mainHome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DioHelper.init();
  runApp(  MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initPlatformState();
  }
  static const String  oneSignalAppId="a4ecafcc-2d68-446e-8b05-ea4c3a22ab5a";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainHomeScreen(),
      initialRoute: RouteHelper.mainScreen,
      getPages: RouteHelper.routes,
    );
  }

  Future<void> initPlatformState()async{
    OneSignal.shared.setAppId(oneSignalAppId);
  }
}

