import 'package:assgiment/screen/home/home_screen.dart';
import 'package:assgiment/screen/login/login_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String homeScreen = "/homeScreen";
  static String getHomeScreen() => "$homeScreen";

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () => LoginScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 200)),
    GetPage(
        name: homeScreen,
        page: () {
          return HomeScreen();
        },
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 200))
  ];
}
