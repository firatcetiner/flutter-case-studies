import 'welcoming_screen_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'welcoming_screen_state.dart';

class WelcomingScreenBloc extends Bloc<WelcomingScreenEvent, WelcomingScreenState> {

  @override
  WelcomingScreenState get initialState => WelcomeOpened(margin: 220);

  @override
  Stream<WelcomingScreenState> mapEventToState(WelcomingScreenEvent event) async* {
    if(event is OpenLogin) {
      yield LoginOpened(margin: 180);
    } else if (event is OpenWelcome) {
      yield WelcomeOpened(margin: 220);
    } else if(event is OpenRegister) {
      yield RegisterOpened(margin: 220);
    }
  }
}