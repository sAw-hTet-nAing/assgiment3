import 'dart:convert';

import 'package:assgiment/model/token_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TokenController extends GetxController {
  RxString token = "".obs;
  var isLoading = false.obs;

  Future<bool> sendRequest(String username, String password) async {
    isLoading.value = true;
    var requestBody = {
      'username': username,
      'password': password,
    };
    try {
      final response = await http.post(
          Uri.parse('http://test.ntrcarparts.xyz/api/delivery/login'),
          body: requestBody);

      if (response.statusCode == 200) {
        Token bearer = Token.fromJson(jsonDecode(response.body));
        token.value = bearer.accessToken;
        setToken(bearer.accessToken);
        isLoading.value = false;
        update();

        return true;
      } else if (response.statusCode != 200) {
        Get.snackbar("Invalid User", "Wrong User Credenticials",
            backgroundColor: Colors.white, colorText: Colors.red[400]);
        isLoading.value = false;
        update();
      } else {
        isLoading.value = false;
        update();
      }

      return false;
    } catch (err) {
      return false;
    }
  }

  Future<void> setToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", value);
    token.value = value;
    update();
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString("accessToken") ?? "";
    return token.value;
  }
}
