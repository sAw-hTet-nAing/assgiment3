import 'dart:convert';

import 'package:assgiment/model/profile_model.dart';
import 'package:http/http.dart' as http;

import 'package:assgiment/controller/token_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString username = "".obs;
  RxString name = "".obs;
  RxString phone = "".obs;
  RxString email = "".obs;
  RxString duty = "".obs;
  RxString warehouse = "".obs;
  RxString role = "".obs;

  var isLoading = true.obs;

  Future<void> fetchProfileData() async {
    String token = await Get.find<TokenController>().getToken();
    try {
      final response = await http.get(
          Uri.parse('http://test.ntrcarparts.xyz/api/logistic/profile'),
          headers: {
            "Content-Type": "application/json; charset= UTF-8",
            "Authorization": "Bearer $token",
          });

      if (response.statusCode == 200) {
        Profile profile = Profile.fromJson(jsonDecode(response.body));
        username.value = profile.data.username;
        name.value = profile.data.name;
        phone.value = profile.data.phone;
        email.value = profile.data.email ?? "no email";
        duty.value = profile.data.duty;
        warehouse.value = profile.data.warehouse;
        role.value = profile.data.roles as String;

        // checking and printing

        isLoading.value = false;
        update();
      } else {
        isLoading.value = false;
        update();
      }
    } catch (e) {
      isLoading.value = false;
      update();
    }
  }
}
