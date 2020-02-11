import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class WelcomingScreenEvent extends Equatable {
  const WelcomingScreenEvent();

  @override
  List<Object> get props => [];
}

class OpenLogin extends WelcomingScreenEvent {
  final double margin;
  final double borderRadius;

  OpenLogin({@required this.margin, @required this.borderRadius});

  @override
  List<Object> get props => [margin, borderRadius];

  @override
  String toString() => 'OpenLogin';
}

class OpenRegister extends WelcomingScreenEvent {
  final double margin;
  final double borderRadius;

  OpenRegister({@required this.margin, @required this.borderRadius});

  @override
  List<Object> get props => [margin, borderRadius];

  @override
  String toString() => 'OpenRegister';
}

class OpenWelcome extends WelcomingScreenEvent {
  final double margin;
  final double borderRadius;

  OpenWelcome({@required this.margin, @required this.borderRadius});

  @override
  List<Object> get props => [margin, borderRadius];

  @override
  String toString() => 'OpenWelcome';
}
