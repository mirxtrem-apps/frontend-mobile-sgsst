import 'package:flutter/material.dart';

class PerfilEmpresaPage extends StatelessWidget {
  const PerfilEmpresaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Perfil Empresa Page')),
        body: const SafeArea(child: Text('Perfil Empresa Controller')));
  }
}
