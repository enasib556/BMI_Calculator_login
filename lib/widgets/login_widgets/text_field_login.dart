import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
 final TextEditingController controller ;
 final  String hintText;
  const TextFieldLogin({super.key,required this.controller,required this.hintText});


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))
          ),
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xF9D15C35)
              )
          )
      ),
    );
  }
}
