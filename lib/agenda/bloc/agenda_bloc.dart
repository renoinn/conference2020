import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:conferenceapp/model/mock_data.dart';
import './bloc.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  @override
  AgendaState get initialState => InitialAgendaState();

  @override
  Stream<AgendaState> mapEventToState(
    AgendaEvent event,
  ) async* {
    if (event is InitAgenda) {
      yield* mapInitToState(event);
    }
    if (event is SwitchDay) {
      yield* mapSwitchToState(event);
    }
  }

  Stream<AgendaState> mapSwitchToState(SwitchDay event) async* {
    yield PopulatedAgendaState(event.day,
        talks.where((t) => t.dateTime.day == 22 + event.day).toList());
  }

  Stream<AgendaState> mapInitToState(InitAgenda event) async* {
    await Future.delayed(Duration(seconds: 1));
    yield PopulatedAgendaState(
        1, talks.where((t) => t.dateTime.day == 23).toList());
  }
}
