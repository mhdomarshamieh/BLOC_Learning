import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    // state = state + 1; => doesn't work because state is a getter
    emit(state + 1);
  }

  void decrement() {
    if (state == 0) return;
    emit(state - 1);
  }
}
