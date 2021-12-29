import 'package:bloc_sample/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Created by Naveen Verma on 22-12-2021
/// To The New
/// naveen.verma@tothenew.com

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, CounterState>(
          builder: (context, state) {
            if (state.counterValue < 0) {
              return Text(
                "NEGATIVE! ${state.counterValue}",
                style: Theme.of(context).textTheme.headline4,
              );
            } else if (state.counterValue % 2 == 0) {
              return Text(
                "EVEN! ${state.counterValue}",
                style: Theme.of(context).textTheme.headline4,
              );
            } else {
              return Text(
                "ODD! ${state.counterValue}",
                style: Theme.of(context).textTheme.headline4,
              );
            }
          },
          listener: (context, state) {
            if (state.wasIncremented == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Yay! Number was INCREMENTED")));
            } else if (state.wasIncremented == false) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Yay! Number was DECREMENTED")));
            }
          },
        ),
      ),
    );
  }
}
