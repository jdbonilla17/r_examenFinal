import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/providers/calendar_provider.dart';
import 'package:movil_wrc_app/responseTypes/calendar_response.dart';
import 'package:movil_wrc_app/widgets/tile_calendar.dart';


class CalendarPage extends ConsumerWidget {
  const CalendarPage({Key? key}) : super(key: key);
  static const name = 'calendar';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CalendarResponse> calendarProv =
        ref.watch(calendarProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Calendar",
          style: TextStyle(color: CupertinoColors.black),
        ),
        backgroundColor: CupertinoColors.black,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Center(
            child: calendarProv.when(
              data: (calendarData) => Column(
                children: calendarData.content
                    .map((element) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TileCalendar(
                            imgUrlLocation: element.images.isNotEmpty
                                ? element.images[0].url
                                : '',
                            imgUrlFlagCountry: element.championshipLogo.isNotEmpty
                                ? element.championshipLogo[0].url
                                : '',
                            nameRally: element.title,
                            nameCountry: element.location,
                            startDate: element.startDate,
                            endDate: element.endDate,
                          ),
                        ))
                    .toList(),
              ),
              loading: () => Center(
                child: CupertinoActivityIndicator(),
              ),
              error: (error, stack) => Center(
                child: Text(
                  'Error: $error',
                  style: TextStyle(color: CupertinoColors.systemRed),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
