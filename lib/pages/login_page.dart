import 'dart:ui';

import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool loginBtnClicked = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_img.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Text(
              "$name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 36.0,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        loginBtnClicked = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: loginBtnClicked ? 40 : 150,
                      height: loginBtnClicked ? 40 : 35,
                      alignment: Alignment.center,
                      child: loginBtnClicked
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              loginBtnClicked ? "OK" : "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(loginBtnClicked ? 40 : 7),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   child: Text(
                  //     "Login",
                  //   ),
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 30)),
                  //   onPressed: () {
                  //     print("Hi codepur");
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
