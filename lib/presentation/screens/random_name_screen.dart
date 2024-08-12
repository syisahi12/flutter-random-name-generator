import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_generator/bloc/random_name/random_name_bloc.dart';
import 'package:name_generator/presentation/widgets/random_name_display.dart';

class RandomNameScreen extends StatelessWidget {
  const RandomNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Name Generator'),
      ),
      body: Center(
        child: BlocBuilder<RandomNameBloc, RandomNameState>(
          builder: (context, state) {
            if (state is RandomNameInitial) {
              return const Text('Press the button to generate a name');
            } else if (state is RandomNameLoading) {
              return const CircularProgressIndicator();
            } else if (state is RandomNameLoaded) {
              return RandomNameDisplay(name: '${state.randomName.firstName} ${state.randomName.lastName}');
            } else if (state is RandomNameError) {
              return Text('Error: ${state.message}');
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<RandomNameBloc>().add(FetchRandomName()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}