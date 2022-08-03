import 'package:assgiment/controller/token_controller.dart';
import 'package:assgiment/route/routehelper.dart';
import 'package:assgiment/screen/home/home_screen.dart';
import 'package:assgiment/screen/login/login_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool vis = true;
  final _globalkey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final tokenController = Get.find<TokenController>();
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          decoration: BoxDecoration(color: Colors.amber[300]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Center(
                    child: Image(
                      image: AssetImage("assets/Logofood.png"),
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Center(
                      child: Text("Please Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 30,
                  )
                ]),
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Form(
                                key: _globalkey,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black))),
                                      child: TextFormField(
                                        controller: _usernameController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter Your Username"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black)),
                                      ),
                                      child: TextFormField(
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter Your Password"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Create New Accounts")),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber[300]),
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: GestureDetector(
                                        onTap: (() async {
                                          print("Tapped");
                                          bool getToken =
                                              await tokenController.sendRequest(
                                                  _usernameController.text,
                                                  _passwordController.text);

                                          if (getToken) {
                                            loginController.setLogin(true);
                                            Get.toNamed(
                                                RouteHelper.getHomeScreen());
                                          }
                                        }),
                                        child: Center(
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  )),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
