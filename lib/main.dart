import 'package:assgiment/route/route_controller.dart';
import 'package:assgiment/route/routehelper.dart';
import 'package:assgiment/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void checkLogin() async {}

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: RouteController(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
