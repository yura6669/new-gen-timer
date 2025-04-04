part of 'timer_cubit.dart';

abstract class TimerState extends Equatable {
  final TimerModel timerModel;

  const TimerState(this.timerModel);

  @override
  List<Object?> get props => [timerModel];
}

class _Initial extends TimerState {
  _Initial() : super(TimerModel.initialData());

  @override
  List<Object?> get props => [];
}

class _Loaded extends TimerState {
  const _Loaded(super.timerModel);

  @override
  List<Object?> get props => [timerModel];
}
