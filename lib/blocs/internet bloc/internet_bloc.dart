import 'dart:async';

import 'package:connectivity_app_bloc/blocs/internet%20bloc/internet_event.dart';
import 'package:connectivity_app_bloc/blocs/internet%20bloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  //initializing the bloc
  InternetBloc() : super(InternetInitialState()) {
    //these methods keeps a check on events on((event,emit) => null);
    on<InternetLostEvent>((event, emit) {
      return emit(InternetLostState());
    });

    on<InternetGainedEvent>((event, emit) {
      return emit(InternetGainedState());
    });

    connectivitySubscription = connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
