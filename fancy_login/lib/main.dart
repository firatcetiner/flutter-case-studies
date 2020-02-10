import 'package:fancy_login/bloc/welcoming_screen_bloc.dart';
import 'package:fancy_login/welcoming_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy Login Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider.value(
        value: WelcomingScreenBloc(),
        child: WelcomingScreen(),
      ),
    );
  }
}

