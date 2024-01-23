import 'package:get_it/get_it.dart';
import 'package:guerilla_test/clients/bloc/client_bloc.dart';
import 'package:guerilla_test/clients/controllers/clients_controller.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ClientBloc(controller: sl()));

  // Controllers
  sl.registerLazySingleton(
    () => ClientsController(
      httpClient: sl(),
    ),
  );

  // External Packages
  sl.registerLazySingleton(() => http.Client()); // http Client
}
