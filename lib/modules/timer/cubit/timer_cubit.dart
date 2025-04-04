import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:timer/core/models/timer_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(_Initial());

  Timer? _timer;
  TimerModel _timerModel = TimerModel.initialData();

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTimer();
      emit(_Loaded(_timerModel));
    });
  }

  void pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      _timerModel = _timerModel.copyWith(timerStatus: TimerStatus.paused);
      emit(_Loaded(_timerModel));
    }
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    _timerModel = TimerModel.initialData();
    emit(_Initial());
  }

  void updateTimerType(TimerType timerType) {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    int newHour = _timerModel.hour;
    int newMinute = _timerModel.minute;
    int newSecond = _timerModel.second;

    newHour = 24 - _timerModel.hour;
    newMinute = 59 - _timerModel.minute;
    newSecond = 59 - _timerModel.second;
    if (newHour < 0) {
      newHour = 24;
    }
    if (newMinute < 0) {
      newMinute = 59;
    }
    if (newSecond < 0) {
      newSecond = 59;
    }

    _timerModel = _timerModel.copyWith(
      hour: newHour,
      minute: newMinute,
      second: newSecond,
      timerType: timerType,
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTimer(isTimer: timerType == TimerType.timer);
      emit(_Loaded(_timerModel));
    });
  }

  _updateTimer({bool isTimer = false}) {
    _timerModel = _timerModel.copyWith(timerStatus: TimerStatus.running);
    int hour = _timerModel.hour;
    int minute = _timerModel.minute;
    int second = _timerModel.second;
    int newSecond = isTimer ? (second - 1) : (second + 1);
    if (isTimer) {
      if (newSecond == -1) {
        newSecond = 59;
        minute--;
      }
      if (minute == -1) {
        minute = 59;
        hour--;
      }
    } else {
      if (newSecond == 60) {
        newSecond = 0;
        minute++;
      }
      if (minute == 60) {
        minute = 0;
        hour++;
      }
    }
    _timerModel = _timerModel.copyWith(
      hour: hour,
      minute: minute,
      second: newSecond,
    );
  }
}
