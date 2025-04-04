import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/modules/timer/cubit/timer_cubit.dart';
import 'package:timer/resources/app_colors.dart';
import 'package:timer/router/router.dart';

class TimerApp extends StatefulWidget {
  const TimerApp({super.key});

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  final AppRouter router = AppRouter();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.setLocale(const Locale('en', 'US'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => TimerCubit())],
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Timer App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.bg),
        routerConfig: router.config(),
      ),
    );
  }
}
