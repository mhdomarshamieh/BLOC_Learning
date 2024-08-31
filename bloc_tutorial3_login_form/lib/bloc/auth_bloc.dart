import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  @override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    if (kDebugMode) print('AuthBloc - $change');
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    if (kDebugMode) print('AuthBloc - $transition');
  }

  void _onAuthLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(
      AuthLoading(),
    );
    try {
      final email = event.email;
      final password = event.password;

      if (password.length < 6) {
        emit(
          AuthFailure('Password cannot be less than 6 characters'),
        );
        return;
      }

      await Future.delayed(
        const Duration(seconds: 2),
        () {
          return emit(
            AuthSuccess(uid: '$email-$password'),
          );
        },
      );
    } catch (e) {
      emit(
        AuthFailure(
          e.toString(),
        ),
      );
      return;
    }
  }

  void _onAuthLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          return emit(AuthInitial());
        },
      );
    } catch (e) {
      emit(
        AuthFailure(
          e.toString(),
        ),
      );
    }
  }
}
