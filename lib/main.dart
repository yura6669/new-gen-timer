import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:timer/timer_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('uk', 'UA')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: TimerApp(),
    ),
  );
}
