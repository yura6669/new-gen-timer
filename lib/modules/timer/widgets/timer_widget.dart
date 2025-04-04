import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:timer/core/models/timer_model.dart';
import 'package:timer/modules/timer/cubit/timer_cubit.dart';
import 'package:timer/modules/timer/widgets/gradient_ark.dart';
import 'package:timer/modules/timer/widgets/squares_border.dart';
import 'package:timer/resources/app_colors.dart';
import 'package:timer/resources/resorces.dart';

class TimerWidget extends StatefulWidget {
  final TimerModel timerModel;
  const TimerWidget(this.timerModel, {super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late double _opacity;

  @override
  void initState() {
    _opacity = 1.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context),
        SizedBox(height: adaptiveHeight(context, 5.2)),
        _buildTimer(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(seconds: 1),
      child: Text(
        _getTimerTitle(context),
        style: customTextStyle(context, size: 8.4),
      ),
    );
  }

  Widget _buildTimer(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: GradientArcPainter(),
          size: Size(adaptiveWidth(context, 80), 0),
        ),
        Container(
          width: adaptiveWidth(context, 80),
          height: adaptiveWidth(context, 80),
          decoration: BoxDecoration(
            color: AppColors.timerBg,
            shape: BoxShape.circle,
            border: GradientBoxBorder(
              width: 1.72,
              gradient: LinearGradient(
                colors: [
                  AppColors.white.withValues(alpha: 1.0),
                  AppColors.white.withValues(alpha: 0.0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.4),
                offset: Offset(
                  adaptiveWidth(context, 0.4),
                  adaptiveWidth(context, 0.4),
                ),
                blurRadius: adaptiveWidth(context, 4.7),
                blurStyle: BlurStyle.inner,
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.1),
                offset: Offset(
                  -adaptiveWidth(context, 2.8),
                  adaptiveWidth(context, 2.3),
                ),
                blurRadius: adaptiveWidth(context, 4.65),
              ),
            ],
          ),
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 1),
            child: RotatedBox(
              quarterTurns: -1,
              child: CustomPaint(
                painter: SquaresBorderPainter(
                  currentSecond: widget.timerModel.second,
                ),
              ),
            ),
          ),
        ),
        _buildTime(context),
      ],
    );
  }

  Widget _buildTime(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(seconds: 1),

      child: GestureDetector(
        onTap: () => _onChangeType(context),
        child: Center(
          child: Container(
            color: AppColors.transparent,
            padding: EdgeInsets.symmetric(
              vertical: adaptiveHeight(context, 1.1),
            ),
            child: Text(
              _getFormatTime(context),
              textAlign: TextAlign.center,
              style: customTextStyle(context, size: 7.4),
            ),
          ),
        ),
      ),
    );
  }

  String _getTimerTitle(BuildContext context) {
    if (widget.timerModel.timerType == TimerType.timer) {
      return context.tr('timer-title');
    } else {
      return context.tr('stopwatch-title');
    }
  }

  String _getFormatTime(BuildContext context) {
    String hour = widget.timerModel.hour.toString().padLeft(2, '0');
    String minute = widget.timerModel.minute.toString().padLeft(2, '0');
    String second = widget.timerModel.second.toString().padLeft(2, '0');
    String hourDescr = context.tr('time-hours');
    String minuteDescr = context.tr('time-minutes');
    String secondDescr = context.tr('time-seconds');
    return '$hour$hourDescr  $minute$minuteDescr $second$secondDescr';
  }

  void _onChangeType(BuildContext context) {
    if (widget.timerModel.timerStatus == TimerStatus.running) {
      if (widget.timerModel.timerType == TimerType.stopwatch) {
        context.read<TimerCubit>().updateTimerType(TimerType.timer);
        _changeOpacity();
      } else {
        context.read<TimerCubit>().updateTimerType(TimerType.stopwatch);
        _changeOpacity();
      }
    }
  }

  void _changeOpacity() async {
    _opacity = _opacity == 0 ? 1.0 : 0.0;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    _opacity = _opacity == 0 ? 1.0 : 0.0;
    setState(() {});
  }
}
