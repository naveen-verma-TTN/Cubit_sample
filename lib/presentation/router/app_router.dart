import 'package:bloc_sample/logic/cubit/counter_cubit.dart';
import 'package:bloc_sample/logic/cubit/internet_cubit.dart';
import 'package:bloc_sample/presentation/screen/home_screen.dart';
import 'package:bloc_sample/presentation/screen/second_screen.dart';
import 'package:bloc_sample/presentation/screen/third_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Created by Naveen Verma on 22-12-2021
/// To The New
/// naveen.verma@tothenew.com

class AppRouter {
  final CounterCubit _counterCubit =
      CounterCubit(internetCubit: InternetCubit(connectivity: Connectivity()));

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: const HomeScreen(
                  title: 'Flutter Demo Home Page',
                  color: Colors.lightBlue,
                )));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                  title: "Second Screen",
                  color: Colors.lightGreen,
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                  title: "Third Screen",
                  color: Colors.blueGrey,
                ));
      default:
        return null;
    }
  }

  void dispose() {
    // _counterCubit.close();
  }
}
