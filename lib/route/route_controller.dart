import 'package:assgiment/screen/home/home_controller.dart';
import 'package:get/get.dart';

import '../controller/token_controller.dart';
import '../screen/login/login_controller.dart';

class RouteController extends Bindings {
  @override
  void dependencies() {
    Get.put<TokenController>(TokenController());
    Get.put<HomeController>(HomeController());
    Get.put<LoginController>(LoginController());
  }
}
