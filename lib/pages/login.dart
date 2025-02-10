import 'package:flutter/material.dart';
import 'package:project1/widgets/login_widgets/custom_elevated_button_log.dart';
import 'package:project1/widgets/login_widgets/text_field_login.dart';

import '../widgets/custom_bottom_navigationBar.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFC33E2D), Color(0xF9D15C35)],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 85),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 41,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.7155,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // height: 120,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xF9D15C35).withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(-2, 5))
                            ]),
                        child: Column(
                          children: [
                            TextFieldLogin(
                                controller: emailController,
                                hintText: 'Email or Phone number'),
                            Divider(
                              height: 1,
                              color: Colors.grey[300]?.withOpacity(0.5),
                            ),
                            TextFieldLogin(
                                controller: passwordController,
                                hintText: 'Password'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Forget Password?',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      CustomElevatedButtonLog(
                        text: 'Login',
                        color: null,
                        useGradient: true,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      const Text(
                        'Continue with social media',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomElevatedButtonLog(
                            text: 'Facebook',
                            color: Colors.blue,
                            useGradient: false,
                            width: 140,
                          ),
                          CustomElevatedButtonLog(
                            text: 'Githup',
                            color: Colors.black,
                            useGradient: false,
                            width: 140,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavigationbar(color: const Color(0xF9D15C35), currentIndex: 2,)
          )
        ],
      ),
    );
  }
}
