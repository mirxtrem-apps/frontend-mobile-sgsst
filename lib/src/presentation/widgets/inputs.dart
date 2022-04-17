import 'package:flutter/material.dart';
import 'package:software_sgsst/src/app/utils/email_validator.dart';

extension Input on TextFormField {
  static email({
    String labelText = "Correo electrónico",
    FocusNode? focusNode,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction,
  }) {
    // TODO:Agregar un RegExp para validar un email
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Ingrese su correo electrónico",
        labelText: labelText,
      ),
      validator: (value) => value!.isEmpty || !value.isEmail()
          ? "Ingrese un correo válido"
          : null,
    );
  }

  static password({
    String labelText = "Contraseña",
    String? Function(String?)? validator,
    FocusNode? focusNode,
    TextEditingController? controller,
    bool obscureText = true,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction,
    VoidCallback? onVisibilityPressed,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        hintText: "Ingrese su contraseña",
        labelText: labelText,
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: onVisibilityPressed,
        ),
      ),
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return "Ingrese su contraseña";
            }
            if (value.length < 6) {
              return "Contraseña muy corta";
            }
            // Add more validators
            return null;
          },
    );
  }

  static text({
    String labelText = "Input text",
    String hintText = "Hint text",
    String? Function(String?)? validator,
    FocusNode? focusNode,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction,
  }) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
      validator: validator,
    );
  }

  static textMultiline({
    String labelText = "Input text",
    String hintText = "Hint text",
    required String? Function(String?)? validator,
    FocusNode? focusNode,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction,
  }) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
      validator: validator,
    );
  }

  static number({
    String labelText = "Input number",
    String hintText = "Hint text",
    String? initialValue,
    required String? Function(String?)? validator,
    FocusNode? focusNode,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction,
  }) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
      validator: validator,
    );
  }

  static currency({
    String labelText = "Input number",
    String hintText = "Hint text",
    required String? Function(String?)? validator,
    FocusNode? focusNode,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction,
  }) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
      validator: validator,
    );
  }

  static phone({
    String labelText = "Número celular",
    String hintText = "Ingrese un número celular",
    required String? Function(String?)? validator,
    FocusNode? focusNode,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction,
  }) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
      validator: validator ??
          (value) {
            if (value!.length != 10) {
              return "Ingrese un teléfono válido";
            }
            // Add more validators
            return null;
          },
    );
  }

  static DropdownButtonFormField<T> selector<T>({
    required String labelText,
    required T initialValue,
    required List<Map<T, String>> items,
    void Function(T?)? onChanged,
  }) {
    List<DropdownMenuItem<T>> menuItems = [];
    for (var e in items) {
      e.forEach((key, value) {
        menuItems.add(
          DropdownMenuItem<T>(
            value: key,
            child: Text(value),
          ),
        );
      });
    }

    return DropdownButtonFormField<T>(
      items: menuItems,
      value: initialValue,
      isDense: true,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      onChanged: onChanged,
    );
  }
}
