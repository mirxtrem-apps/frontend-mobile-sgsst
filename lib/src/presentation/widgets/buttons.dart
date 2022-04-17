import 'package:flutter/material.dart';
import 'package:software_sgsst/src/presentation/theme/app_colors.dart';

import '../theme/label_styles.dart';

extension Button on MaterialButton {
  // Solid Button
  static MaterialButton solid({
    required VoidCallback? onPressed,
    required String label,
    bool isAccent = true,
  }) {
    return MaterialButton(
      elevation: 0.0,
      height: 50.0,
      color: isAccent ? AppColors.accent : AppColors.primary,
      disabledColor: Colors.blueGrey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: LabelStyle.solidButton(
          color: isAccent ? AppColors.black : AppColors.accent,
        ),
      ),
    );
  }

  // Solid Button
  static MaterialButton solidWithIcon({
    required VoidCallback? onPressed,
    required String label,
    IconData icon = Icons.upload,
    bool isAccent = true,
  }) {
    return MaterialButton(
      elevation: 0.0,
      // height: 50.0,
      color: isAccent ? AppColors.accent : AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(
            label,
            style: LabelStyle.solidButton(
              color: isAccent ? AppColors.primary : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Solid Button
  static MaterialButton color({
    required VoidCallback? onPressed,
    required String label,
    Color color = Colors.black12,
    Color textColor = Colors.black,
  }) {
    return MaterialButton(
      elevation: 0.0,
      height: 50.0,
      color: color,
      disabledColor: Colors.blueGrey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: LabelStyle.solidButton(
          color: textColor,
        ),
      ),
    );
  }

  // Outlined Button
  static MaterialButton outlined({
    required VoidCallback? onPressed,
    required String label,
  }) {
    return MaterialButton(
      height: 50.0,
      elevation: 0.0,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: LabelStyle.outlinedButton(),
      ),
    );
  }

  // Flat Button
  static TextButton flat({
    required VoidCallback? onPressed,
    required String label,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: LabelStyle.outlinedButton(),
      ),
    );
  }

  // Link Button
  static TextButton link({
    required VoidCallback? onPressed,
    required String label,
    Color? linkColor = AppColors.greyLight,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: LabelStyle.linkButton(
          color: linkColor,
        ),
      ),
    );
  }
}
