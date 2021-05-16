import 'package:ev_stations/constants/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class AboutStation extends StatefulWidget {
  @override
  _AboutStationState createState() => _AboutStationState();
}

class _AboutStationState extends State<AboutStation> {
  int _selectedTab = 0;
  List<String> _tabs = ['LOCATION', 'CHARGERS', 'DISCOUNTS', 'REVIEWS'];
  List<Widget> _tabBodies;

  @override
  void initState() {
    super.initState();
    _tabBodies = [
      buildLocationBody(),
      buildChargersBody(),
      buildDiscountsBody(),
      buildReviewsBody()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.blackColor,
        body: buildBody(),
      ),
    );
  }

  getHeader() {
    return Column(
      children: [
        Container(
          child: Stack(
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
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
        ),
      ],
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          getHeader(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: _tabs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTab = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10),
                            child: Text(
                              _tabs[index],
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: _selectedTab == index
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                ),
                Divider(color: Palette.darkBlue),
              ],
            ),
          ),
          _tabBodies[_selectedTab],
        ],
      ),
    );
  }

  buildLocationBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Divider(color: Colors.grey),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedTab = 1;
            });
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Reserve',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              color: Palette.primaryColor,
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        ),
        Divider(color: Colors.grey),
        Container(
          height: 50.0,
          child: Container(
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Icon(FlutterIcons.location_ent),
                SizedBox(width: 20.0),
                Text(
                  'Nyeri, Kenya',
                  style: TextStyle(color: Colors.white70, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: Color(0xFF252c34),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Icon(FlutterIcons.timer_mdi),
                SizedBox(width: 20.0),
                Row(
                  children: [
                    Text(
                      'Open',
                      style: TextStyle(color: Colors.green, fontSize: 14.0),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '|  24/7',
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: Color(0xFF252c34),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Icon(FlutterIcons.phone_mdi),
                SizedBox(width: 20.0),
                Text(
                  '+254 700001267',
                  style: TextStyle(color: Colors.white70, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50.0,
          child: Container(
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Icon(FlutterIcons.parking_mco),
                SizedBox(width: 20.0),
                Text(
                  'Free for regulars',
                  style: TextStyle(color: Colors.white70, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'The DV charging station is located at the starting point of the Cairo ¬'
            ' Sokhna road, the rest of the terminals will be deployed and gradually commissioned by the end of 2018. '
            '\n \n \nIt is a Terra 53 multi-standard DC charging terminal that allows fast charging, with a single, double or triple 50 kW output configuration, operational over a temperature range of -35 to +55° Celsius,” says ABB. He added, “ABB is the first company to offer fast chargers in Egypt and we hope this will be the first step towards a wider use of electric vehicles and local reductions in carbon and particle emissions to help improve the community’s life in the near future',
            style: TextStyle(
                letterSpacing: 0.7,
                wordSpacing: 1,
                color: Colors.grey,
                fontSize: 16),
          ),
        ),
      ],
    );
  }

  buildChargersBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Text('Chargers'),
        )
      ],
    );
  }

  buildDiscountsBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Text('No discounts'),
        )
      ],
    );
  }

  buildReviewsBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Text('No reviews'),
        )
      ],
    );
  }
}
