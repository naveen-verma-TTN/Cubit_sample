import 'package:bloc_sample/logic/cubit/counter_cubit.dart';
import 'package:bloc_sample/logic/cubit/internet_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';

/// Created by Naveen Verma on 21-12-2021
/// To The New
/// naveen.verma@tothenew.com

void main() {
  group("CounterCubit", () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit(
          internetCubit: InternetCubit(connectivity: Connectivity()));
    });

    test(
        "the initial state for the CounterCubit is CounterState(counterValue: 0)",
        () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });

    blocTest<CounterCubit, CounterState>(
      "the cubit should emit a CounterState(CounterValue: 1, wasIncremented: true) when cubit.increment() function was called",
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      "the cubit should emit a CounterState(CounterValue: 0, wasIncremented: false) when cubit.decrement() function was called",
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );

    tearDown(() {
      counterCubit.close();
    });
  });
}
