import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_sgsst/src/app/app_routes.dart';

import 'package:software_sgsst/src/data/services/api_service.dart';
import 'package:software_sgsst/src/presentation/theme/app_theme.dart';

import '../domain/repository/account_repository.dart';
import '../domain/repository/auth_repository.dart';

class SGSSTApp extends StatelessWidget {
  const SGSSTApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthRepository(
            apiRepository: ApiRepository(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => AccountRepository(
            apiRepository: ApiRepository(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'SG-SST App',
        theme: AppTheme.light(context),
        initialRoute: '/',
        routes: AppNavigator.router,
      ),
    );
  }
}
