import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? minLines;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final TextAlign? textAlign;

  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.textAlign,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.minLines,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
      child: TextFormField(
        validator: validator!,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        maxLines: minLines ?? 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red[900]!,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          icon: icon != null ? Icon(icon, size: 20) : null,
          hintText: hintText!,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
