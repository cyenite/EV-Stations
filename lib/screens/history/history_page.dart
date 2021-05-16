import 'package:ev_stations/constants/pallete.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Reserve history',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Reserve',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF272a2f),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(FlutterIcons.search_mdi, color: Colors.grey),
                        SizedBox(width: 10.0),
                        Text(
                          'Search',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                    Icon(
                      FlutterIcons.mic_fea,
                      color: Palette.greyColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),

              ///My discounts start here...
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My discounts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'more',
                    style: TextStyle(color: Palette.primaryColor),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFF252c34),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '-2%',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Station 1',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'till 21.01.22',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 16.0),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'available',
                          style: TextStyle(
                              color: Palette.primaryColor, fontSize: 16.0),
                        ),
                      ],
                    ),
                    Container(
                      width: 80,
                      height: 40,
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Details',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Palette.primaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),

              ///My bookings start here...
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My bookings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'more',
                    style: TextStyle(color: Palette.primaryColor),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFF252c34),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1 hour',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Station 1',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '21.05.21 | 15:00',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 16.0),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'active',
                          style: TextStyle(color: Colors.blue, fontSize: 16.0),
                        ),
                      ],
                    ),
                    Container(
                      width: 80,
                      height: 40,
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Navigate',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Palette.primaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFF252c34),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '3 hours',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Station 47',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '15.06.21 | 13:30',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 16.0),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'pending',
                          style:
                              TextStyle(color: Colors.orange, fontSize: 16.0),
                        ),
                      ],
                    ),
                    Container(
                      width: 80,
                      height: 40,
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Navigate',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Palette.primaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFF252c34),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '3 hours',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Station 45',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '14.06.21 | 13:30',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 16.0),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'cancelled',
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                        ),
                      ],
                    ),
                    Container(
                      width: 80,
                      height: 40,
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Navigate',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
