import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movil_wrc_app/pages/calendar_page.dart';
import 'package:movil_wrc_app/pages/dashboard_page.dart';
import 'package:movil_wrc_app/pages/drivers_page.dart';
import 'package:movil_wrc_app/pages/home_page.dart';

class RoutesNames {
  static String home = '/';
  static String dashboard = '/dashboard';
  static String calendar = '/calendar';
  static String drivers = '/drivers';
}

final routerProvider = Provider((ref) => appRouter);

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomePage.name,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/dashboard',
    name: DashboardPage.name,
    builder: (context, state) => const DashboardPage(),
  ),
  GoRoute(
    path: '/calendar',
    name: CalendarPage.name,
    builder: (context, state) => const CalendarPage(),
  ),
  GoRoute(
    path: '/drivers',
    name: DriversPage.name,
    builder: (context, state) => const DriversPage(),
  ),
]);
