import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerilla_test/clients/bloc/client_bloc.dart';
import 'package:guerilla_test/clients/client_argument.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Clients'),
        ),
        body: BlocBuilder<ClientBloc, ClientState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.clients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/client',
                            arguments: ClientArguments(
                              state.clients[index]!,
                            ));
                      },
                      child: Text(
                          '${state.clients[index]!.firstName} ${state.clients[index]!.lastName}'),
                    ),
                  );
                });
          },
        ));
  }
}
