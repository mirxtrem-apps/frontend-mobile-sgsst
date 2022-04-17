import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class Modals {
  static loading(BuildContext context, [String? message]) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
              ),
              const SizedBox(width: 12.0),
              Flexible(
                child: Text(
                  message ?? 'Cargando...',
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static close(BuildContext context) {
    Navigator.pop(context);
  }
}
