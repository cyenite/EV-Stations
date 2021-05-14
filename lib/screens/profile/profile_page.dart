import 'package:ev_stations/constants/pallete.dart';
import 'package:ev_stations/screens/auth/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user;
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController(text: "04-19-1992");
  TextEditingController password = TextEditingController(text: "123456");
  @override
  Widget build(BuildContext context) {
    final litUser = context.getSignedInUser();
    litUser.when(
      (litUser) => user = litUser,
      empty: () {},
      initializing: () {},
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Palette.blackColor, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60, right: 20, left: 20, bottom: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.signOut();
                            Get.off(AuthScreen());
                          },
                          child: Icon(AntDesign.logout),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    readOnly: true,
                    controller: _email,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                        hintText: "Email", border: InputBorder.none),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*   Text(
                  "Date of birth",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextField(
                  controller: dateOfBirth,
                  cursorColor: black,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: InputDecoration(
                      hintText: "Date of birth", border: InputBorder.none),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Date of birth",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextField(
                  obscureText: true,
                  controller: password,
                  cursorColor: black,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: InputDecoration(
                      hintText: "Password", border: InputBorder.none),
                ),*/
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
