import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_sgsst/src/presentation/theme/label_styles.dart';
import 'package:software_sgsst/src/presentation/widgets/buttons.dart';
import 'package:software_sgsst/src/presentation/widgets/inputs.dart';
import 'package:software_sgsst/src/presentation/widgets/modal.dart';

import '../../../data/services/shared_prefs.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../theme/app_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
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
                  'Inicio de sesión',
                  style: LabelStyle.heading(fontSize: FontSize.s24),
                ),
                const SizedBox(height: 12.0),
                Input.email(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailCtrl,
                ),
                const SizedBox(height: 12.0),
                Input.password(
                  controller: passCtrl,
                  obscureText: obscureText,
                  onVisibilityPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: double.infinity,
                  child: Button.solid(
                    label: 'Ingresar',
                    onPressed: () => _login(
                      context,
                      email: emailCtrl.text,
                      password: passCtrl.text,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: double.infinity,
                  child: Button.link(
                    label: '¿Olvidaste tu contraseña?',
                    onPressed: () => router.pushNamed('/reset-password'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    final auth = Provider.of<AuthRepository>(context, listen: false);
    if (formKey.currentState!.validate()) {
      Modals.loading(context, "Iniciando sesión, por favor espere.");
      try {
        final result = await auth.login(
          email: emailCtrl.text,
          password: passCtrl.text,
        );
        Modals.close(context);
        if (result["ok"]) {
          SharedPrefs prefs = SharedPrefs();
          final userId = result["data"]["id"] as int;
          prefs.userId = userId;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Bienvenido"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (route) => false,
            arguments: {"userId": userId},
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${result['error']}"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          );
        }
      } catch (e) {
        Modals.close(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: ${e.toString()}"),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      }
    }
  }
}
