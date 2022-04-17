import 'package:flutter/material.dart';

import '../../theme/app_fonts.dart';
import '../../theme/label_styles.dart';
import '../../widgets/buttons.dart';
import '../../widgets/inputs.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar mi contraseña'),
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
                  'Recuperar mi contraseña',
                  style: LabelStyle.heading(fontSize: FontSize.s24),
                ),
                const SizedBox(height: 12.0),
                Input.email(),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: double.infinity,
                  child: Button.solid(
                    label: 'Recuperar mi contraseña',
                    onPressed: () {},
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
