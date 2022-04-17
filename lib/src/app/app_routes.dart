import 'package:software_sgsst/src/presentation/modules/auth/login_page.dart';
import 'package:software_sgsst/src/presentation/modules/auth/registro_page.dart';
import 'package:software_sgsst/src/presentation/modules/auth/reset_password.dart';
import 'package:software_sgsst/src/presentation/modules/home/home_page.dart';
import 'package:software_sgsst/src/presentation/modules/landing/landing_page.dart';

import '../presentation/modules/account/perfil_empresa.dart';

class AppNavigator {
  static final router = {
    "/": (context) => const LandingPage(),
    "/login": (context) => const LoginPage(),
    "/registro": (context) => const RegistroPage(),
    "/reset-password": (context) => const ResetPasswordPage(),
    "/perfil": (context) => const PerfilEmpresaPage(),
    "/home": (context) => const HomePage(),
  };
}
