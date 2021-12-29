import 'package:bloc_sample/constants/internet_enum.dart';
import 'package:bloc_sample/logic/cubit/counter_cubit.dart';
import 'package:bloc_sample/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

/// Created by Naveen Verma on 22-12-2021
/// To The New
/// naveen.verma@tothenew.com

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // BlocListener called one times, use blocConsumer for better restructuring the code
      // body: BlocListener<CounterCubit, CounterState>(
      // listener: (context, state) {
      //   if (state.wasIncremented == true) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(content: Text("Yay! Number was INCREMENTED")));
      //   } else if (state.wasIncremented == false) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(content: Text("Yay! Number was DECREMENTED")));
      //   }
      // },
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /**
             * watch bloc
             */
            Builder(builder: (context) {
              final counterState = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;

              if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.wifi) {
                return Text(
                  "Counter: ${counterState.counterValue} WIFI",
                  style: const TextStyle(fontSize: 20.0, color: Colors.green),
                );
              } else if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.mobile) {
                return Text(
                  "Counter: ${counterState.counterValue} MOBILE",
                  style: const TextStyle(fontSize: 20.0, color: Colors.blue),
                );
              } else if (internetState is InternetDisconnected) {
                return Text(
                  "Counter: ${counterState.counterValue} DISCONNECTED",
                  style: const TextStyle(fontSize: 20.0, color: Colors.grey),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),

            /**
             * Selector bloc
             */
            Builder(builder: (context) {
              final counterValue = context
                  .select((CounterCubit cubit) => cubit.state.counterValue);
              return Text(
                'Counter: $counterValue',
                style: Theme.of(context).textTheme.headline6,
              );
            }),
            // BlocBuilder<InternetCubit, InternetState>(
            //     builder: (context, state) {
            //   if (state is InternetConnected &&
            //       state.connectionType == ConnectionType.wifi) {
            //     return const Text("WIFI");
            //   } else if (state is InternetConnected &&
            //       state.connectionType == ConnectionType.mobile) {
            //     return const Text("MOBILE");
            //   } else if (state is InternetDisconnected) {
            //     return const Text("DISCONNECTED");
            //   } else {
            //     return const CircularProgressIndicator();
            //   }
            // }),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'You have pushed the button this many times:',
                textAlign: TextAlign.center,
              ),
            ),
            // BlocConsumer<CounterCubit, CounterState>(
            //   // BlocBuilder called multiple times, use blocConsumer instead
            //   // BlocBuilder<CounterCubit, CounterState>(
            //   //   builder: (context, state) {
            //   builder: (context, state) {
            //     if (state.counterValue < 0) {
            //       return Text(
            //         "NEGATIVE! ${state.counterValue}",
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     } else if (state.counterValue % 2 == 0) {
            //       return Text(
            //         "EVEN! ${state.counterValue}",
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     } else {
            //       return Text(
            //         "ODD! ${state.counterValue}",
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     }
            //   },
            //   listener: (context, state) {
            //     if (state.wasIncremented == true) {
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //           content: Text("Yay! Number was INCREMENTED")));
            //     } else if (state.wasIncremented == false) {
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //           content: Text("Yay! Number was DECREMENTED")));
            //     }
            //   },
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).decrement();
                    context.read<CounterCubit>().decrement();
                  },
                  tooltip: "Decrement",
                  heroTag: "btn1",
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context, false).increment();
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: "Increment",
                  heroTag: "btn2",
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second'
                    // MaterialPageRoute(
                    //   builder: (_) => BlocProvider.value(
                    //     value: BlocProvider.of<CounterCubit>(context),
                    //     child: const SecondScreen(
                    //       title: "Second Screen",
                    //       color: Colors.lightGreen,
                    //     ),
                    //   ),
                    // ),
                    );
              },
              color: Colors.lightGreen,
              child: const Text("Go to Second Screen"),
            ),
            const SizedBox(
              height: 50.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third'
                    // MaterialPageRoute(
                    //   builder: (_) => BlocProvider.value(
                    //     value: BlocProvider.of<CounterCubit>(context),
                    //     child: const SecondScreen(
                    //       title: "Third Screen",
                    //       color: Colors.blueGrey,
                    //     ),
                    //   ),
                    // ),
                    );
              },
              color: Colors.blueGrey,
              child: const Text("Go to Third Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
