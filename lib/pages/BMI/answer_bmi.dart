import 'package:flutter/material.dart';
import 'package:project1/pages/BMI/bmi_calculator.dart';
import 'package:project1/widgets/Bmi_widgets/custom_elevated_button.dart';

class AnswerBmi extends StatelessWidget {
  final int weight;
  final double height;

  AnswerBmi({super.key, required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI(weight, height);
    String category = getBMICategory(bmi);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            const Text(
              'Your Result',
              style: TextStyle(
                  color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.6,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 31, 29, 29),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      category,
                      style: TextStyle(
                          color: getColor(bmi),
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          color: Colors.white, fontSize: 90, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      getBMIDescription(category),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const BmiCalculator()));
              },
              nameButton: 'Re_Calculate',
            ),
          ],
        ),
      ),
    );
  }
}

double calculateBMI(int weight, double height) {
  return weight / (height * height);
}

String getBMICategory(double bmi) {
  if (bmi < 18.5) {
    return "UNDERWEIGHT";
  } else if (bmi >= 18.5 && bmi < 24.9) {
    return "NORMAL";
  } else if (bmi >= 25 && bmi < 29.9) {
    return "OVERWEIGHT";
  } else {
    return "OBESE";
  }
}

Color getColor(double bmi) {
  if (bmi < 18.5) {
    return Colors.blue;
  } else if (bmi >= 18.5 && bmi < 24.9) {
    return Colors.green;
  } else if (bmi >= 25 && bmi < 29.9) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

String getBMIDescription(String category) {
  switch (category) {
    case "UNDERWEIGHT":
      return "You are underweight. Try to eat more balanced meals.";
    case "NORMAL":
      return "You have a normal body weight. Good job!";
    case "OVERWEIGHT":
      return "You are slightly overweight. Consider a healthier diet and exercise.";
    case "OBESE":
      return "You are in the obese category. It's important to adopt a healthy lifestyle.";
    default:
      return "";
  }
}
