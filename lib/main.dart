import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled10/pages/homescreen.dart';
import 'package:untitled10/pages/playlistscreen.dart';
import 'package:untitled10/pages/songscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'MUSIC APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        ),
      ),
    home: HomeScreen(),
      getPages: [
        GetPage(name: '/', page: ()=>HomeScreen()),
        GetPage(name: '/song', page: ()=>SongScreen()),
        GetPage(name: '/playlist', page: ()=>PlaylistScreen())
      ],

    );
  }
}

