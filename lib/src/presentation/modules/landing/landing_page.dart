import 'package:flutter/material.dart';
import 'package:software_sgsst/src/data/services/shared_prefs.dart';
import 'package:software_sgsst/src/presentation/theme/app_fonts.dart';
import 'package:software_sgsst/src/presentation/theme/label_styles.dart';

import '../../widgets/buttons.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = Navigator.of(context);
    final prefs = SharedPrefs();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://software-sgsst.web.app/banner.c18e70ab032328f837cb.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Text(
                  'Sistema de Gestión de Seguridad y Salud en el Trabajo',
                  style: LabelStyle.heading(color: Colors.white),
                ),
                Text(
                  'Implementar el Sistema de Gestión de Seguridad y Salud en el Trabajo nunca fue tan fácil, conoce las ventajas de tener un software que le facilita a las empresas las tareas del SGSST.',
                  style: LabelStyle.paragraph(
                    color: Colors.white,
                    fontSize: FontSize.s20,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Button.solid(
                    onPressed: () => router.pushNamed('/registro'),
                    label: 'Registrar mi empresa',
                  ),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: double.infinity,
                  child: Button.solid(
                    isAccent: false,
                    onPressed: () {
                      debugPrint(prefs.userId.toString());
                      if (prefs.userId != null) {
                        router.popAndPushNamed('/home',
                            arguments: {"userId": prefs.userId});
                      } else {
                        router.pushNamed('/login');
                      }
                    },
                    label: 'Iniciar sesión',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
