import 'package:ev_stations/constants/pallete.dart';
import 'package:flutter/material.dart';

class StationDetail extends StatefulWidget {
  final Size size;
  final String stationName;
  StationDetail({@required this.stationName, @required this.size});

  @override
  _StationDetailState createState() => _StationDetailState();
}

class _StationDetailState extends State<StationDetail> {
  @override
  Widget build(BuildContext context) {
    /*return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            widget.stationName,
            style: TextStyle(
                color: Palette.primaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 10.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        )),
      ],
    );*/
    return Container(
      width: widget.size.width * 0.55,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Station',
                      style: TextStyle(
                        color: Palette.greyColor,
                        fontSize: 8.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.stationName,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Open',
                          style: TextStyle(
                            fontSize: 8.0,
                            color: Palette.primaryColor,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          '24/7',
                          style: TextStyle(
                            color: Palette.greyColor,
                            fontSize: 8.0,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Icon(
                  Icons.assistant_navigation,
                  color: Colors.blue,
                )
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '17 Moi Avenue, Nairobi',
                  style: TextStyle(
                    color: Palette.greyColor,
                    fontSize: 8.0,
                  ),
                ),
                Text(
                  '12.2KM',
                  style: TextStyle(
                    color: Palette.greyColor,
                    fontSize: 8.0,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Palette.primaryColor,
                        size: 12,
                      ),
                      Text(
                        'Go To-U',
                        style: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.bold),
                      ),
                      Text('|'),
                      Text(
                        '22kwt',
                        style: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(Icons.ev_station_outlined, size: 12),
                      Icon(Icons.ev_station_outlined, size: 12),
                      Icon(Icons.ev_station_outlined, size: 12),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Not Occupied',
              style: TextStyle(
                  color: Palette.primaryColor,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'BOOK',
                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
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
    );
  }
}
