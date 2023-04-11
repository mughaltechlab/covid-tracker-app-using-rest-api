import 'dart:convert';

import 'package:covid_tracker/model/world_state_model.dart';
import 'package:covid_tracker/services/util/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  // function for fetching world records
  Future<WorldStateModel> fetchWorldStateRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('error in Worldrecords Api');
    }
  }

  // function for fetching countries information
  Future<List<dynamic>> fetchCountriesRecords() async {
    dynamic data;
    final response = await http.get(Uri.parse(AppUrl.countryApi));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('error in countries APi');
    }
  }

  // function for fetching country records
}
