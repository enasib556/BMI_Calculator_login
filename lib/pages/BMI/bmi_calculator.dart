import 'package:flutter/material.dart';
import 'package:project1/pages/BMI/answer_bmi.dart';
import 'package:project1/widgets/Bmi_widgets/custom_elevated_button.dart';
import 'package:project1/widgets/Bmi_widgets/gender_container.dart';
import 'package:project1/widgets/Bmi_widgets/weight_age_container.dart';
import 'package:project1/widgets/custom_bottom_navigationBar.dart';

import '../../widgets/Bmi_widgets/gender_enum.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Gender? selectedGender;
  double currentSliderValue = 177;
  int weight = 70;
  int age = 20;
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),

      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenderContainer(
                      icon: Icons.male,
                      type: 'Male',
                      gender: Gender.male,
                      selectedGender: selectedGender,
                      onSelect: (Gender gender) {
                        setState(() {
                          selectedGender = gender;
                        });
                      },
                    ),
                    const SizedBox(width: 20),
                    GenderContainer(
                      icon: Icons.female,
                      type: 'Female',
                      gender: Gender.female,
                      selectedGender: selectedGender,
                      onSelect: (Gender gender) {
                        setState(() {
                          selectedGender = gender;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 170,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 31, 29, 29),
                      borderRadius: BorderRadius.circular(14)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      const Text('Height',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('$currentSliderValue',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold)),
                          const Text(
                            'cm',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Slider(
                          value: currentSliderValue,
                          min: 120,
                          max: 200,
                          divisions: 80,
                          activeColor: const Color.fromARGB(255, 151, 4, 4),
                          onChanged: (value) {
                            setState(() {
                              currentSliderValue = value;
                            });
                          })
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WeightAgeContainer(value: 70, name: 'Weight'),
                    const SizedBox(width: 20),
                    WeightAgeContainer(value: 20, name: 'Age')
                  ],
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnswerBmi(
                                  weight: weight,
                                  height: currentSliderValue / 100,
                                )),
                      );
                    },
                    nameButton: 'Calculate',
                  ),
                )
              ],
            ),
          ),
        ),
         Align(
          alignment: Alignment.bottomCenter,
          child: CustomBottomNavigationbar(color:const Color.fromARGB(255, 151, 4, 4), currentIndex: 0 ,)
        )
      ]),
    );
  }
}
