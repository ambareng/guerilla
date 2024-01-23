import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final int id;
  final String firstName;
  final String lastName;

  const Client(
      {required this.id, required this.firstName, required this.lastName});

  @override
  List<Object> get props => [id, firstName, lastName];

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );
  }
}
