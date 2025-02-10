import 'package:flutter/material.dart';

import 'gender_enum.dart';

class GenderContainer extends StatelessWidget {
  final Gender gender;
  final IconData icon;
  final String type;
  final Gender? selectedGender;
  final Function(Gender) onSelect;

  const GenderContainer({
    super.key,
    required this.icon,
    required this.type,
    required this.gender,
    required this.onSelect,
    required this.selectedGender,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(gender);
      },
      child: Container(
        height: 170,
        width: MediaQuery.sizeOf(context).width * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: selectedGender == gender
              ? const Color.fromARGB(255, 151, 4, 4)
              : const Color.fromARGB(255, 31, 29, 29),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 80,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              type,
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
