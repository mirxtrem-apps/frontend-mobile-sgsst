import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_sgsst/src/data/services/shared_prefs.dart';
import 'package:software_sgsst/src/domain/repository/account_repository.dart';
import 'package:software_sgsst/src/presentation/theme/app_colors.dart';
import 'package:software_sgsst/src/presentation/theme/app_fonts.dart';
import 'package:software_sgsst/src/presentation/theme/label_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthRepository>(context, listen: false);
    final account = Provider.of<AccountRepository>(context, listen: false);
    final router = Navigator.of(context);
    final prefs = SharedPrefs();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("SG-SST"),
        actions: [
          IconButton(
            onPressed: () async {
              await prefs.removeUserId();
              router.pushReplacementNamed('/');
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      drawer: _buildDrawer(router),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Map<String, dynamic>>(
            future: account.obtenerPerfil(userId: args['userId']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              final empresa = snapshot.data!['data'];
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Nit: ${empresa['nit']}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Razon Social: ${empresa['razon_social']}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dirección: ${empresa['direccion']}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Telefono: ${empresa['telefono']}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Drawer _buildDrawer(NavigatorState router) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              child: Center(
                child: Image(
                  image: AssetImage('assets/img/logo-hor.png'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.domain,
                color: AppColors.accent,
              ),
              title: const Text(
                'Mi Empresa',
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.s18,
                ),
              ),
              onTap: () {},
            ),
            const Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                "SG-SST",
                style: LabelStyle.heading(
                  fontSize: FontSize.s24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.assignment,
                color: AppColors.accent,
              ),
              title: const Text(
                'Mis Clasificaciones',
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.s18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.assignment,
                color: AppColors.accent,
              ),
              title: const Text(
                'Mis Clasificaciones',
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.s18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.assignment_late,
                color: AppColors.accent,
              ),
              title: const Text(
                'Mis Evaluaciones',
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.s18,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
