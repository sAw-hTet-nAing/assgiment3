import 'package:assgiment/controller/token_controller.dart';
import 'package:assgiment/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.amber[300],
      ),
      body: ProfileInfo(),
    );
  }
}

class ProfileInfo extends StatefulWidget {
  ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    homeController.fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 40,
                            color: Colors.orange[300],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                              child: Text(
                            homeController.name.value,
                            style: TextStyle(fontSize: 18),
                          ))
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.verified_user_outlined,
                            size: 40,
                            color: Colors.orange[300],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                              child: Text(
                            homeController.username.value,
                            style: TextStyle(fontSize: 18),
                          ))
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 40,
                            color: Colors.orange[300],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                              child: Text(
                            homeController.email.value,
                            style: TextStyle(fontSize: 18),
                          ))
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_android_outlined,
                            size: 40,
                            color: Colors.orange[300],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                              child: Text(
                            homeController.phone.value,
                            style: TextStyle(fontSize: 18),
                          ))
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.work_outline,
                            size: 40,
                            color: Colors.orange[300],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                              child: Text(
                            homeController.duty.value,
                            style: TextStyle(fontSize: 18),
                          ))
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.house_siding_outlined,
                            size: 40,
                            color: Colors.orange[300],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                              child: Text(
                            homeController.warehouse.value,
                            style: TextStyle(fontSize: 18),
                          ))
                        ],
                      ),
                    ),
                  )),
              InkWell(
                onTap: () async {
                  Get.find<LoginController>().alterLogin();
                  Get.find<TokenController>().setToken("");
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 5.0,
                      vertical: 10),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amber[300],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.logout, color: Colors.white70),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
