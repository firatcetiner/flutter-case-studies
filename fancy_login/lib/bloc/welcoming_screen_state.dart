import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class WelcomingScreenState extends Equatable {
  final double margin;
  final double borderRadius;
  const WelcomingScreenState({@required this.margin, @required this.borderRadius});

  @override
  List<Object> get props => [margin, borderRadius];

}

class WelcomeOpened extends WelcomingScreenState {
  final double margin;

  WelcomeOpened({@required this.margin});

  @override
  List<Object> get props => [margin];
  @override
  double get borderRadius => super.borderRadius;
}

class RegisterOpened extends WelcomingScreenState {
  final double margin;

  RegisterOpened({@required this.margin});

  @override
  List<Object> get props => [margin];
  @override
  double get borderRadius => super.borderRadius;
}

class LoginOpened extends WelcomingScreenState {
  final double margin;

  LoginOpened({@required this.margin});

  @override
  List<Object> get props => [margin];
  @override
  double get borderRadius => super.borderRadius;
}

