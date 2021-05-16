import 'package:ev_stations/constants/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rubber/rubber.dart';

import 'booking/booking_calendar.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  String _date = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
  RubberAnimationController _controller;

  @override
  void initState() {
    _controller = RubberAnimationController(
      vsync: this, // Thanks to the mixin
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.height = MediaQuery.of(context).size.height * 0.5;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.blackColor,
        body: RubberBottomSheet(
          lowerLayer: buildBody(),
          upperLayer: buildBottomSheet(),
          animationController: _controller,
        ),
      ),
    );
  }

  buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.menu_open_outlined,
                    color: Palette.blueColor,
                    size: 28,
                  ),
                  SizedBox(width: 15.0),
                  Icon(
                    FlutterIcons.ios_battery_charging_ion,
                    color: Palette.blueColor,
                    size: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Station Reservation',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        EventCalendar(),
      ],
    );
  }

  buildBottomSheet() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF252c34),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 100,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          // bottomSheetItem(),
        ],
      ),
    );
  }

  bottomSheetItem() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Day Rate',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'The cost of 1KWh',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '- 3 units',
                    style: TextStyle(
                      color: Palette.darkBlue,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '1 minute idle time cost',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '- 4 units',
                    style: TextStyle(
                      color: Palette.darkBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '07:00 - 18:00',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
