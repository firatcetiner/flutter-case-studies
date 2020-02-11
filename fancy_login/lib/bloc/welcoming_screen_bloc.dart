import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_scan/welcoming_screen/bloc/welcome_screen_state.dart';
import 'welcome_screen_event.dart';

class WelcomingScreenBloc extends Bloc<WelcomingScreenEvent, WelcomingScreenState> {

  @override
  WelcomingScreenState get initialState => WelcomeOpened(margin: 220, borderRadius: 30);

  @override
  Stream<WelcomingScreenState> mapEventToState(WelcomingScreenEvent event) async* {
    if(event is OpenLogin) {
      yield LoginOpened(margin: event.margin, borderRadius: event.borderRadius);
    } else if (event is OpenWelcome) {
      yield WelcomeOpened(margin: event.margin, borderRadius: event.borderRadius);
    } else if(event is OpenRegister) {
      yield RegisterOpened(margin: event.margin, borderRadius: event.borderRadius);
    }
  }
}