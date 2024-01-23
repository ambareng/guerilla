import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerilla_test/clients/bloc/client_bloc.dart';
import 'package:guerilla_test/clients/views/client_page.dart';
import 'package:guerilla_test/clients/views/clients_page.dart';
import 'package:guerilla_test/home/views/home_page.dart';
import 'package:guerilla_test/injector.dart';
import 'package:guerilla_test/records/views/recrods_page.dart';
import 'package:guerilla_test/injector.dart' as dependency_injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injector.init();
  runApp(const HealthLinkProApp());
}

class HealthLinkProApp extends StatelessWidget {
  const HealthLinkProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ClientBloc>()..add(ClientGetAllEvent()),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/clients': (context) => const ClientsPage(),
          '/client': (context) => const ClientPage(),
          '/records': (context) => const RecordsPage(),
        },
      ),
    );
  }
}
