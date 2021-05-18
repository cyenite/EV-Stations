import 'package:ev_stations/models/charger_model.dart';

class Station {
  final String name;
  final List<Charger> chargers;
  final double lat;
  final double lon;

  Station({this.name, this.chargers, this.lat, this.lon});
}
