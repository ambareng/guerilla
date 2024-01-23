import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerilla_test/clients/bloc/client_bloc.dart';
import 'package:guerilla_test/clients/client_argument.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ClientArguments;

    final clientBloc = BlocProvider.of<ClientBloc>(context)
      ..add(ClientGetVisits(id: args.client.id));

    return Scaffold(
        appBar: AppBar(
          title: Text('${args.client.firstName} ${args.client.lastName}'),
        ),
        body: BlocBuilder<ClientBloc, ClientState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.visits.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.visits[index]!.visitDate,
                    ),
                  );
                });
          },
        ));
  }
}
