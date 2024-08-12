import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_generator/bloc/random_name/random_name_bloc.dart';
import 'package:name_generator/data/resources/random_name_resource.dart';
import 'package:name_generator/presentation/screens/random_name_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Name Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => RandomNameBloc(RandomNameResource()),
        child: const RandomNameScreen(),
      ),
    );
  }
}
