import 'package:equatable/equatable.dart';

enum TimerType { stopwatch, timer }

enum TimerStatus { running, paused, stopped }

class TimerModel extends Equatable {
  final int hour;
  final int minute;
  final int second;
  final TimerType timerType;
  final TimerStatus timerStatus;

  const TimerModel({
    required this.hour,
    required this.minute,
    required this.second,
    required this.timerType,
    required this.timerStatus,
  });

  @override
  List<Object?> get props => [hour, minute, second, timerType, timerStatus];

  TimerModel copyWith({
    int? hour,
    int? minute,
    int? second,
    TimerType? timerType,
    TimerStatus? timerStatus,
    bool? isRunning,
  }) {
    return TimerModel(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      second: second ?? this.second,
      timerType: timerType ?? this.timerType,
      timerStatus: timerStatus ?? this.timerStatus,
    );
  }

  factory TimerModel.initialData() {
    return const TimerModel(
      hour: 0,
      minute: 0,
      second: 0,
      timerType: TimerType.stopwatch,
      timerStatus: TimerStatus.stopped,
    );
  }
}
