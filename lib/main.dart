import 'package:flutter/material.dart';
import 'package:software_sgsst/src/data/services/shared_prefs.dart';

import 'src/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(const SGSSTApp());
}
