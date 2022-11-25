import 'package:flutter/material.dart';
import 'package:flutter_steam_db/data/domain/controller/home_controller.dart';
import 'package:flutter_steam_db/ui/home_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.lazyPut(() => HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SteamDb App',
      theme: ThemeData(
        // fontFamily: 'Helvetica',
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
