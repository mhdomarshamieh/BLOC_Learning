import 'package:bloc_tutorial1/bloc/counter_bloc.dart';
import 'package:bloc_tutorial1/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementDecrementPage extends StatelessWidget {
  const IncrementDecrementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => counterBloc.add(CounterIncremented()),
          tooltip: 'Increment',
          icon: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 10,
        ),
        IconButton(
          onPressed: () => counterBloc.add(CounterDecremented()),
          tooltip: 'Increment',
          icon: const Icon(Icons.minimize),
        ),
      ],
    );
  }
}
