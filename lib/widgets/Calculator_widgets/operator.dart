import 'package:flutter/material.dart';

class Operator extends StatelessWidget {
  final Function() onPressed;
  final IconData? icon;
  final String? text;

  const Operator({
    super.key,
    required this.onPressed,
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xffD7DFF6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(14),
          child: Center(
            child: icon != null
                ? Icon(icon, size: 20, color: Colors.black)
                : Text(
              text ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
