import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/repository/auth_repository.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../theme/label_styles.dart';
import '../../widgets/buttons.dart';
import '../../widgets/inputs.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthRepository>(context);
    final router = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar mi empresa'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Image(
                    image: AssetImage('assets/img/logo-hor.png'),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Registrar mi empresa',
                  style: LabelStyle.heading(fontSize: FontSize.s24),
                ),
                const SizedBox(height: 12.0),
                Input.email(),
                const SizedBox(height: 12.0),
                Input.password(
                  obscureText: obscureText,
                  onVisibilityPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                const SizedBox(height: 12.0),
                CheckboxListTile(
                  value: true,
                  activeColor: AppColors.accent,
                  onChanged: (val) {},
                  title: const Text('Acepto los términos y condiciones'),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  value: true,
                  onChanged: (val) {},
                  activeColor: AppColors.accent,
                  title: const Text(
                      'Acepto la política de tratamiento de datos personales'),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: double.infinity,
                  child: Button.solid(
                    label: 'Registrar mi empresa',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 12.0),
                Center(
                  child: Text(
                    '¿Ya tienes cuenta?',
                    style: LabelStyle.paragraph(),
                  ),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: double.infinity,
                  child: Button.color(
                    label: 'Iniciar sesión',
                    onPressed: () {
                      router.pushReplacementNamed('/login');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
