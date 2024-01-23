part of 'client_bloc.dart';

enum ClientStatus { initial, loading, success, failure }

class ClientState extends Equatable {
  final ClientStatus status;
  final List<Client?> clients;
  final List<Visit?> visits;

  const ClientState(
      {this.status = ClientStatus.initial,
      this.clients = const [],
      this.visits = const []});

  @override
  List<Object> get props => [status, clients, visits];

  ClientState copyWith(
          {ClientStatus? status, List<Client>? clients, List<Visit>? visits}) =>
      ClientState(
        status: status ?? this.status,
        clients: clients ?? this.clients,
        visits: visits ?? this.visits,
      );
}
