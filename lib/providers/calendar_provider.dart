import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/responseTypes/calendar_response.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final calendarProvider =
    FutureProvider.autoDispose<CalendarResponse>((ref) async {
  final dio = ref.watch(dioProvider);

  final response = await dio.get(
    'https://api.wrc.com/content/filters/calendar?championship=wrc&origin=vcms&year=2024',
  );
  final responseData = response.data;
  final calendar = CalendarResponse.fromJson(responseData);

  return calendar;
});
