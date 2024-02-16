import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/providers/drivers_provider.dart';
import 'package:movil_wrc_app/responseTypes/drivers_response.dart';
import 'package:movil_wrc_app/widgets/tile_driver.dart';

class DriversPage extends ConsumerWidget {
  const DriversPage({Key? key}) : super(key: key);
  static const name = 'drivers';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<DriversResponse> driverProv = ref.watch(driversProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Drivers",
          style: TextStyle(color: CupertinoColors.black),
        ),
        backgroundColor: CupertinoColors.black,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Center(
            child: driverProv.when(
              data: (driversResponse) => Column(
                children: driversResponse.content
                    .map(
                      (driver) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TileDriver(
                          imgUrlDriver: driver.images.isNotEmpty
                              ? driver.images[0].url
                              : '',
                          imgUrlFlagCountry: driver.country.flag.isNotEmpty
                              ? driver.country.flag[0].url
                              : '',
                          nameDriver: driver.name ?? '',
                          roleDriver: driver.type ?? '',
                          team: driver.team ?? '',
                          car: driver.car ?? 'No Car Specified',
                        ),
                      ),
                    )
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
