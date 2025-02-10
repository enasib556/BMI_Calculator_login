import 'package:flutter/material.dart';

class CustomElevatedButtonLog extends StatelessWidget {
  final String text;
  final bool? useGradient;
  final Color? color;
  final double width;

   CustomElevatedButtonLog({
    super.key,
    required this.text,  this.useGradient,  this.color, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: useGradient! ? Colors.transparent : const Color(0xFFC33E2D), // لون ثابت عند إلغاء التدرج
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: useGradient!
              ? const LinearGradient(
            colors: [Color(0xFFC33E2D), Color(0xF9D15C35)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          )
              : null,
          color: useGradient! ? null :  color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          width: width,
          height: 45,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
