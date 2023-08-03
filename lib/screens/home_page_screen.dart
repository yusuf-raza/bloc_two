import 'package:connectivity_app_bloc/blocs/internet%20bloc/internet_bloc.dart';
import 'package:connectivity_app_bloc/blocs/internet%20bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connectivity with bloc"),
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context)
                  .showMaterialBanner(MaterialBanner(backgroundColor: Colors.green, content: const Text("Connected"), actions: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                  },
                  child: const Text(
                    'Agree',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]));

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet connected"),
                backgroundColor: Colors.green,
              ));
            } else {
              ScaffoldMessenger.of(context)
                  .showMaterialBanner(MaterialBanner(backgroundColor: Colors.red, content: const Text("Connected"), actions: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                  },
                  child: const Text(
                    'Agree',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet disconnected"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected");
            } else if (state is InternetLostState) {
              return const Text("Disconnected");
            } else {
              return const Text("Loading...");
            }
          },
        )

        /*BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected");
            } else if (state is InternetLostState) {
              return const Text("Disconnected");
            } else {
              return const Text("Loading...");
            }
          },
        )*/
        ,
      ),
    );
  }
}
