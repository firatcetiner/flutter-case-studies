import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class WelcomingScreenState extends Equatable {

  const WelcomingScreenState();

  @override
  List<Object> get props => [];

}

class WelcomeOpened extends WelcomingScreenState {
  final double margin;
  final double borderRadius;

  WelcomeOpened({@required this.borderRadius, @required this.margin});

  @override
  List<Object> get props => [margin, borderRadius];

}

class RegisterOpened extends WelcomingScreenState {
  final double margin;
  final double borderRadius;

  RegisterOpened({@required this.borderRadius, @required this.margin});

  RegisterOpened update(double margin, double borderRadius) {
    return RegisterOpened(
      margin: margin,
      borderRadius: borderRadius
    );
  }

  @override
  List<Object> get props => [margin, borderRadius];
}

class LoginOpened extends WelcomingScreenState {
  final double margin;
  final double borderRadius;

  LoginOpened({@required this.borderRadius, @required this.margin});

  LoginOpened update(double margin, double borderRadius) {
    return LoginOpened(
      margin: margin,
      borderRadius: borderRadius
    );
  }

  @override
  List<Object> get props => [margin, borderRadius];

}
