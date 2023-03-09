import 'dart:convert';

import 'package:flutter_application_2/model/quakemodel.dart';
import 'package:http/http.dart';

class Network {
  Future<Quake> getAllQuakes() async {
    var apiUrl =
        "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";

    final response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // print('Quake data: ${response.body}');
      return Quake.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting quakes');
    }
  }
}
