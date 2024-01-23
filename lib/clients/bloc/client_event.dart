part of 'client_bloc.dart';

sealed class ClientEvent extends Equatable {
  const ClientEvent();

  @override
  List<Object> get props => [];
}

class ClientGetAllEvent extends ClientEvent {}

class ClientGetVisits extends ClientEvent {
  final int id;

  const ClientGetVisits({required this.id});

  @override
  List<Object> get props => [id];
}
