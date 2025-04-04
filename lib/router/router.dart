import 'package:auto_route/auto_route.dart';
import 'package:timer/modules/home/home_screen.dart';
import 'package:timer/modules/settings/settings_screen.dart';
import 'package:timer/modules/timer/timer_screen.dart';

part "router.gr.dart";

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: TimerRoute.page, path: 'timer'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
  ];
}
