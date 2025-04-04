import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:timer/resources/app_colors.dart';
import 'package:timer/resources/resorces.dart';
import 'package:timer/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        lazyLoad: false,
        routes: [TimerRoute(), SettingsRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => tabsRouter.setActiveIndex(index),
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.bg,
              unselectedItemColor: AppColors.grey,
              showUnselectedLabels: false,
              selectedLabelStyle: customTextStyle(
                context,
                color: AppColors.bg,
                size: 3.5,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.timer),
                  label: context.tr('timer-tab'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: context.tr('setting-tab'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
