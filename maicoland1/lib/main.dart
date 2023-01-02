
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/repository/authentication_repository.dart';
import 'package:maicolandapp/my_app.dart';
import 'presentation/router/app_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () =>  runApp( // Injects the Authentication service
        RepositoryProvider<AuthenticationRepository>(
          create: (context) {
            return AuthenticationRepository();
          },
          child: MyApp(appRouter: AppRouter()),
          )),
    storage: storage,
  );

 
}
