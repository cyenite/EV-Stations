import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StationDetail extends StatefulWidget {
  final String stationName;
  StationDetail({@required this.stationName});

  @override
  _StationDetailState createState() => _StationDetailState();
}

class _StationDetailState extends State<StationDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
                child: Text(
                  widget.stationName,
                  style: TextStyle(
                      color: Color(0xff6200ee),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(height: 5.0),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      child: Text(
                        "4.1",
                        style: TextStyle(
                          color: Colors.black54,
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
                          color: Colors.black54,
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
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
          SizedBox(height: 5.0),
          Container(
              child: Text(
                "Closed \u00B7 Opens 17:00 Thu",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              )),
        ],
      );
  }
}
