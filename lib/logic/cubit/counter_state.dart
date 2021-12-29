part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});

  @override
  List<Object?> get props => [counterValue, wasIncremented];

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented: map['wasIncremented'] as bool,
    );
  }
}