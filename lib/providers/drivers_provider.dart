
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/responseTypes/drivers_response.dart';

final driversProvider = FutureProvider<DriversResponse>((ref) async {
  try {
    // Make API call to fetch drivers data
    Response response = await Dio().get('https://api.wrc.com/content/driver?class=WRC');

    // Parse the JSON response into a DriversResponse object
    DriversResponse driversResponse = DriversResponse.fromJson(response.data);

    return driversResponse;
  } catch (error) {
    // Handle any errors that occur during the API call
    throw 'Failed to fetch drivers data: $error';
  }
});
