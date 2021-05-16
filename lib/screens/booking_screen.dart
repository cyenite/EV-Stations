import 'package:ev_stations/constants/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.blackColor,
        body: getBody(),
      ),
    );
  }

  getBody() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.afrik21.africa/wp-content/uploads/2018/11/shutterstock_534683026-1-800x400.jpg'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withAlpha(150), BlendMode.darken),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back_ios),
                          SizedBox(width: 5.0),
                          Text('Back',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                    Icon(FlutterIcons.heart_evi, size: 30),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Icon(
                                    FlutterIcons.star_ent,
                                    size: 15,
                                    color: Colors.yellow,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Station 1',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            )
                          ]),
                      Column(
                        children: [
                          Icon(Icons.assistant_navigation,
                              color: Colors.blue, size: 30),
                          SizedBox(height: 5.0),
                          Text(
                            '12.2KM',
                            style: TextStyle(
                              color: Palette.greyColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
        PageView(),
      ],
    );
  }
}
