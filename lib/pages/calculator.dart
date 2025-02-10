import 'package:flutter/material.dart';
import 'package:project1/widgets/Calculator_widgets/custom_text_field.dart';

import '../widgets/Calculator_widgets/operator.dart';
import '../widgets/custom_bottom_navigationBar.dart';

class Calculator extends StatefulWidget {
  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController number1Controller = TextEditingController();

  TextEditingController number2Controller = TextEditingController();
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.44,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                      color: Color(0xFF27A599),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                            controller: number1Controller, hintText: 'Num 1'),
                        const SizedBox(height: 20),
                        CustomTextField(
                            controller: number2Controller, hintText: 'Num 2')
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 20,
                      color: const Color(0xFF27A599),
                    ),
                    Text(
                      'Result = $result ',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 20,
                      color: const Color(0xFF27A599),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.43,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                      color: Color(0xFF27A599),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Operator(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() {
                            result = double.parse(number1Controller.text) +
                                double.parse(number2Controller.text);
                          });
                        },
                      ),
                      Operator(
                        icon: Icons.remove_sharp,
                        onPressed: () {
                          setState(() {
                            result = double.parse(number1Controller.text) -
                                double.parse(number2Controller.text);
                          });
                        },
                      ),
                      Operator(
                        icon: Icons.close,
                        onPressed: () {
                          setState(() {
                            result = double.parse(number1Controller.text) *
                                double.parse(number2Controller.text);
                          });
                        },
                      ),
                      Operator(
                        text: '÷',
                        onPressed: () {
                          setState(() {
                            double num1 =
                                double.tryParse(number1Controller.text) ?? 0;
                            double num2 =
                                double.tryParse(number2Controller.text) ?? 0;
                            if (num2 == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Can't divide by Zero",
                                      textAlign: TextAlign.center),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              result = num1 / num2;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
             Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNavigationbar(color: const Color(0xFF27A599), currentIndex: 1,)
            )
          ],
        ),
      ),
    );
  }
}
