import 'dart:async';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
   CustomTextField({super.key,required this.controller,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return   TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration:  InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          )),
    );
  }
}
