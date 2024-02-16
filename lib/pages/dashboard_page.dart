import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/router/app_router.dart';

class DashboardPage extends ConsumerWidget {
  static const name = 'dashboard';
  const DashboardPage({super.key});
  
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Dashboard"),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: CupertinoListSection(
          header: const Text("List of options:"),
          children: [
            CupertinoListTile(
              title: const Text("Drivers"),
              leading: const Icon(CupertinoIcons.person_2_fill),
              trailing: const Icon(CupertinoIcons.right_chevron),
              onTap: () {
                ref.read(routerProvider).push(RoutesNames.drivers);
              },
            ),
            CupertinoListTile(
              title: const Text("Calendar"),
              leading: const Icon(CupertinoIcons.calendar),
              trailing: const Icon(CupertinoIcons.right_chevron),
              onTap: () {
                ref.read(routerProvider).push(RoutesNames.calendar);
              },
            ),
          ],
        ),
      ),
    );
  }
}
