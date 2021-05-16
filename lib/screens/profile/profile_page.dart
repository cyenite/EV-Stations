import 'package:ev_stations/constants/pallete.dart';
import 'package:ev_stations/screens/auth/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:share/share.dart';

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
      backgroundColor: Palette.blackColor,
      body: getBody(user),
    );
  }

  Widget getBody(User user) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              user.photoURL == null ? '' : user.photoURL),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Text(
                    user.displayName == null ? '' : user.displayName,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black12),
                            child: Center(
                                child: Icon(
                              Icons.money,
                              color: Palette.primaryColor,
                            )),
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                'Units',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                '250',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black12),
                            child: Center(
                                child: Icon(
                              Icons.card_giftcard,
                              color: Palette.primaryColor,
                            )),
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                'Bonuses',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                '90',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 50.0,
                decoration: BoxDecoration(
                    color: Color(0xFF252c34),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone number',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    Text(
                      user.phoneNumber != null ? user.phoneNumber : 'null',
                      style: TextStyle(
                        color: Palette.greyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF252c34),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    Text(
                      user.email == null ? '' : user.email,
                      style: TextStyle(
                        color: Palette.greyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF252c34),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Car brand',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    Row(
                      children: [
                        Text(
                          'Tesla',
                          style: TextStyle(
                            color: Palette.greyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Palette.greyColor,
                          size: 16,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ClipRect(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF252c34),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Car model',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Row(
                        children: [
                          Text(
                            'Model S',
                            style: TextStyle(
                              color: Palette.greyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Palette.greyColor,
                            size: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              ClipRect(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF252c34),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reserves history',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Palette.greyColor,
                            size: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Share.share("Try out this new EV world app! https://");
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF252c34),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Invite your friend',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.share_rounded,
                            color: Colors.white70,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Palette.greyColor,
                            size: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ClipRect(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF252c34),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Palette.greyColor,
                            size: 16,
                          )
                        ],
                      ),
                    ],
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
