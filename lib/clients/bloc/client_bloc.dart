import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerilla_test/clients/controllers/clients_controller.dart';
import 'package:guerilla_test/clients/models/client.dart';
import 'package:guerilla_test/clients/models/visits.dart';

part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientsController controller;

  ClientBloc({required this.controller}) : super(const ClientState()) {
    on<ClientGetAllEvent>((event, emit) async {
      emit(state.copyWith(status: ClientStatus.loading));
      final res = await controller.getAllClients();
      emit(state.copyWith(status: ClientStatus.success, clients: res));
    });

    on<ClientGetVisits>((event, emit) async {
      emit(state.copyWith(status: ClientStatus.loading));
      final res = await controller.getAllClientVisits(event.id);
      print(res);
      emit(state.copyWith(status: ClientStatus.success, visits: res));
    });
  }
}
