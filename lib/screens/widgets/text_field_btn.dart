import 'package:contact/Themes/light_theme.dart';
import 'package:flutter/material.dart';

class TextFieldBtn extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  final void Function(String) onChange;

  const TextFieldBtn({
    super.key,
    required this.lable,
    required this.controller,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      controller: controller,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.titleSmall,
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: LightTheme.secondaryColor,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
        hintStyle: Theme.of(context).textTheme.titleSmall,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: LightTheme.secondaryColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: LightTheme.secondaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
