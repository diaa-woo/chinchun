import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  final String hintText;
  final Color? color;
  final TextEditingController controller;
  final bool? password;
  const CustomTextField(
    {
      super.key,
      required this.text,
      required this.hintText,
      this.color = Colors.black54,
      required this.controller,
      this.password = false
    }
  );

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 25,
      controller: widget.controller,
      obscureText: widget.password!,
      decoration: InputDecoration(
        counterText: '',
        labelText: widget.text,
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 15.sp, color: Colors.teal),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: widget.color!)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: widget.color!)
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
        )
      )
    );
  }
}