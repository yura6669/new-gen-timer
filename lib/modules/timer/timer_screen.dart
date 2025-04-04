import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/core/models/timer_model.dart';
import 'package:timer/modules/timer/cubit/timer_cubit.dart';
import 'package:timer/modules/timer/widgets/timer_widget.dart';
import 'package:timer/resources/resorces.dart';
import 'package:timer/widgets/custom_btn.dart';

@RoutePage()
class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          final TimerModel timerModel = state.timerModel;
          final bool isShowReset =
              timerModel.second > 0 ||
              timerModel.minute > 0 ||
              timerModel.hour > 0;
          final bool isActive = timerModel.timerStatus == TimerStatus.running;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerWidget(state.timerModel),
              SizedBox(height: adaptiveHeight(context, 4.1)),
              CustomBtn(
                text: _getBtnText(context, status: timerModel.timerStatus),
                onPressed:
                    () => _onClick(context, status: timerModel.timerStatus),
                isActive: isActive,
              ),
              if (isShowReset) SizedBox(height: adaptiveHeight(context, 2.6)),
              if (isShowReset)
                CustomBtn(
                  text: _getBtnText(context),
                  onPressed: () => _onClick(context),
                ),
            ],
          );
        },
      ),
    );
  }

  String _getBtnText(BuildContext context, {TimerStatus? status}) {
    String btnText = context.tr('timer-reset');
    if (status != null) {
      btnText = context.tr('timer-start');
      if (status == TimerStatus.running) {
        btnText = context.tr('timer-pause');
      }
    }
    return btnText;
  }

  void _onClick(BuildContext context, {TimerStatus? status}) {
    if (status == null) {
      context.read<TimerCubit>().stopTimer();
    } else {
      if (status == TimerStatus.running) {
        context.read<TimerCubit>().pauseTimer();
      } else {
        context.read<TimerCubit>().startTimer();
      }
    }
  }
}
